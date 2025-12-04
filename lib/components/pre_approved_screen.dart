import 'package:flutter/material.dart';
import 'package:slf/components/notification.dart';
import 'package:slf/model/PreApprovedLoanmodel.dart';
import 'package:slf/services/preapproved_services.dart';
import 'package:slf/utils/global.dart';
import 'package:slf/widgets/menu_screen.dart';

class PreApprovedLoansScreen extends StatefulWidget {
  const PreApprovedLoansScreen({super.key});

  @override
  State<PreApprovedLoansScreen> createState() => _PreApprovedLoansScreenState();
}

class _PreApprovedLoansScreenState extends State<PreApprovedLoansScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _getInterestRate(List<InterestRateModel> rates) {
    if (rates.isEmpty) return "N/A";

    final first = rates.firstWhere(
      (e) => e.term == "0-30",
      orElse: () => InterestRateModel(term: "", rate: 0),
    );

    return "${first.rate}%";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const MenuSectionScreen(),

      backgroundColor: Colors.white,

      body: SafeArea(
        child: FutureBuilder<PreApprovedLoanResponse?>(
          future: PreApprovedLoanService.getPreApprovedLoans(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }

            final data = snapshot.data!;
            final loans = data.loans;
            final totalPreApprovedLoan = data.totalPreApprovedLoan;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------------- TOP BLUE HEADER ----------------
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
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
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
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              loans.isNotEmpty ? loans.first.borrower : "User",
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

                  const SizedBox(height: 12),

                  // ---------------- PRE APPROVED TITLE CARD ----------------
                  Transform.translate(
                    offset: const Offset(0, -40),
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
                              "Pre-Aprroved Loans",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4),
                            Center(
                              child: Text(
                                "Unlock your extra funds. Visit your",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              "nearest SLF store",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ---------------- YELLOW PRE APPROVED OFFER BOX ----------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF5DB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE9B3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "You have ₹ $totalPreApprovedLoan pre-approved!",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "You can still avail an additional amount from your existing gold value. Claim it anytime — your eligibility is already approved.",
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

                  const SizedBox(height: 24),

                  // ---------------- DYNAMIC LOAN CARDS ----------------
                  for (var loan in loans) ...[
                    _preApprovedLoanCard(
                      loanId: loan.id.toString(),
                      eligible: "₹ ${loan.totalValuation}",
                      availed: "₹ ${loan.takenLoan}",
                      available: "₹ ${loan.maxEligible}",
                      rate: _getInterestRate(loan.effectiveInterestRates),
                      weight:
                          "${loan.pledgeItemList.isNotEmpty ? loan.pledgeItemList.first.netWeight : 0} g",
                      type: loan.schemeType,
                    ),
                    const SizedBox(height: 16),
                  ],

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ----------------------- LOAN CARD WIDGET -----------------------
  Widget _preApprovedLoanCard({
    required String loanId,
    required String eligible,
    required String availed,
    required String available,
    required String rate,
    required String weight,
    required String type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Loan ID - $loanId",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Eligible Amount :"),
                Text(
                  eligible,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Amount Availed :"),
                Text(
                  availed,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Available Limit :",
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  available,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Interest Rate :"), Text(rate)],
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Gold Weight :"), Text(weight)],
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Payment Type :"), Text(type)],
            ),
          ],
        ),
      ),
    );
  }
}
