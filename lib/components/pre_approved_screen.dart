import 'package:flutter/material.dart';
import 'package:slf/widgets/menu_screen.dart';

class PreApprovedLoansScreen extends StatelessWidget {
  const PreApprovedLoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- TOP BLUE HEADER ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 45,
                  left: 20,
                  right: 20,
                  bottom: 20,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MenuSectionScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          "Pritesh Pawar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ---------------- PRE APPROVED TITLE CARD ----------------
              Center(
                child: Container(
                  width: width * 0.85,
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(blurRadius: 8, color: Colors.black12),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Pre-approved Loan",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Unlock extra funds. Visit your nearest SLF store",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ],
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
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You have ₹ 75,000 pre-approved!",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
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

              // ---------------- LOAN CARD 1 ----------------
              _preApprovedLoanCard(
                loanId: "SLF25402158",
                eligible: "₹ 2,00,000",
                availed: "₹ 1,50,000",
                available: "₹ 50,000",
                rate: "12%",
                weight: "125g",
                type: "EMI",
              ),

              const SizedBox(height: 16),

              // ---------------- LOAN CARD 2 ----------------
              _preApprovedLoanCard(
                loanId: "SLF25400024",
                eligible: "₹ 1,20,000",
                availed: "₹ 95,000",
                available: "₹ 25,000",
                rate: "12%",
                weight: "78g",
                type: "Bullet",
              ),

              const SizedBox(height: 30),
            ],
          ),
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
              children: const [Text("Payment Type :"), Text("EMI")],
            ),
          ],
        ),
      ),
    );
  }
}
