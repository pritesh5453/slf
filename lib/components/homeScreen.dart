import 'package:flutter/material.dart';
import 'package:slf/components/notification.dart';
import 'package:slf/model/homescreen/homescreen_model.dart';
import 'package:slf/services/homescreen_services.dart';
import 'package:slf/utils/global.dart';
import 'package:slf/widgets/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<LoanDashboardModel?> dashboardFuture;

  @override
  void initState() {
    super.initState();
    dashboardFuture = LoanService().getDashboardData("USER_TOKEN_HERE");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuSectionScreen(),
      backgroundColor: Colors.white,
      body: FutureBuilder<LoanDashboardModel?>(
        future: dashboardFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔵 TOP BLUE HEADER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                      bottom: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF022A7C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _scaffoldKey.currentState!.openDrawer(),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: menuUser?.profileImage != null
                                ? NetworkImage(menuUser!.profileImage!)
                                : const AssetImage("assets/images/profile.png")
                                      as ImageProvider,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back,",
                                style: const TextStyle(
                                  color: Colors.white70, // 🔥 Faint/Light
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                data.activeLoans.isNotEmpty
                                    ? data.activeLoans.first.borrower
                                    : "User",
                                style: const TextStyle(
                                  color: Colors.white, // 🔥 Bright white
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NotificationsScreen(),
                            ),
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ⭐ TOTAL OUTSTANDING
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.86,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: const Text(
                                "Total Outstanding",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Center(
                              child: Text(
                                "₹ ${data.totalOutstanding}",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ⭐ EMI BAR STATIC
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFE8E8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.error, color: Colors.red, size: 30),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Next EMI Due - 15 Nov 2025",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "EMI of ₹13,225 is now due — Pay Now",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ⭐ ACTIVE LOANS TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Active Loans (${data.activeLoansCount})",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              "View All",
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.red,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ⭐ ACTIVE LOAN LIST
                  ...data.activeLoans.map((loan) {
                    final item = loan.pledgeItemList.isNotEmpty
                        ? loan.pledgeItemList.first
                        : null;

                    return buildLoanCard(
                      id: loan.id.toString(),
                      amount: "₹ ${loan.loanAmount}",
                      weight: "${item?.netWeight ?? '--'}g",
                      date: loan.approvalDate ?? "--",
                      nextEmi: null, // nullable
                    );
                  }).toList(),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ⭐ Loan Card
  Widget buildLoanCard({
    required String id,
    required String amount,
    required String weight,
    required String date,
    String? nextEmi,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Loan ID - $id",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Active",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              amount,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              "Gold Weight :   $weight",
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              "Loan Date :   $date",
              style: const TextStyle(color: Colors.black54),
            ),
            if (nextEmi != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "Next EMI :   $nextEmi",
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
