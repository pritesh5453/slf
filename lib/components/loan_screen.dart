import 'package:flutter/material.dart';
import 'package:slf/components/loanDetails.dart';
import 'package:slf/components/notification.dart';
import 'package:slf/model/activeloans.dart';
import 'package:slf/services/loan_services.dart';
import 'package:slf/utils/global.dart';
import 'package:slf/widgets/menu_screen.dart';

class ActiveLoansScreen extends StatefulWidget {
  const ActiveLoansScreen({super.key});

  @override
  State<ActiveLoansScreen> createState() => _ActiveLoansScreenState();
}

class _ActiveLoansScreenState extends State<ActiveLoansScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ActiveLoansResponse? data;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    setState(() {
      loading = true;
    });
    data = await LoanService().fetchActiveLoans();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    final width = MediaQuery.of(context).size.width;

    if (loading || data == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuSectionScreen(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- TOP HEADER ----------------
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
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back,",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          data!.activeLoans.isNotEmpty
                              ? data!.activeLoans.first.borrower
                              : "User",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
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

              // -------------- ACTIVE LOANS TITLE CARD --------------
              Transform.translate(
                offset: const Offset(0, -30),
                child: Center(
                  child: Container(
                    width: width * 0.86,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 22,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 18,
                          color: Colors.black.withOpacity(0.15),
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "Active Loans",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "View your active list below",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ---------------- EMI PAYMENTS ----------------
              if (data!.activeLoans.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "EMI Payments",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),

              const SizedBox(height: 12),

              for (int i = 0; i < data!.activeLoans.length; i++)
                _loanCard(
                  context: context,
                  loan: data!.activeLoans[i],
                  nextEmi: "₹13,325 on 15 Nov",
                ),

              const SizedBox(height: 30),

              // ---------------- BULLET PAYMENTS ----------------
              if (data!.bulletLoans.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Bullet Payments",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),

              const SizedBox(height: 12),

              for (int i = 0; i < data!.bulletLoans.length; i++)
                _loanCard(
                  context: context,
                  loan: data!.bulletLoans[i],
                  nextEmi: "—",
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Loan Card UI ----------------
  Widget _loanCard({
    required BuildContext context,
    required LoanModel loan,
    required String nextEmi,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoanDetailsScreen(
              loanId: loan.id.toString(),
              userName: loan.borrower,
              amount: loan.netPayable.toString(),
              goldWeight: loan.netWeight.toString(),
              startDate: loan.approvalDate,
              tenure: "${loan.loanTenure ?? 12} Months",
              totalPaid: loan.loanAmountPaid.toString(),
              pledgeItems: loan.pledgeItems,
              remark: loan.remark,
              ornamentPhoto: loan.ornamentPhoto,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loan ID Row
              Row(
                children: [
                  Text(
                    "Loan ID - ${loan.id}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7FBE8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Active",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                "₹ ${loan.netPayable}",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 14),

              Column(
                children: [
                  _rowInfo("Gold Weight :", "${loan.netWeight} g"),
                  const SizedBox(height: 6),
                  _rowInfo("Loan Date :", loan.approvalDate.split(" ").first),
                ],
              ),

              if (nextEmi != "—") ...[
                const SizedBox(height: 10),
                Text(
                  "Next EMI : $nextEmi",
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Row helper
Widget _rowInfo(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: const TextStyle(color: Colors.black54)),
      Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
    ],
  );
}
