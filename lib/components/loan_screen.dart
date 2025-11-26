import 'package:flutter/material.dart';
import 'package:slf/components/loanDetails.dart';
import 'package:slf/widgets/menu_screen.dart';

class ActiveLoansScreen extends StatelessWidget {
  const ActiveLoansScreen({super.key});

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

              const SizedBox(height: 10),

              // ---------------- ACTIVE LOANS CARD ----------------
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
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black12,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Active Loans",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "View your active list below",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ---------------- EMI PAYMENTS ----------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "EMI Payments",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),

              // Loan Card
              _loanCard(
                context: context,
                loanId: "SLF25402158",
                amount: "₹ 1,50,000",
                weight: "125g",
                loanDate: "15 Jan 2025",
                nextEmi: "₹13,325 on 15 Nov",
              ),

              const SizedBox(height: 30),

              // ---------------- BULLET PAYMENTS ----------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Bullet Payments",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),

              _loanCard(
                context: context,
                loanId: "SLF25400024",
                amount: "₹ 95,000",
                weight: "78g",
                loanDate: "15 July 2025",
                nextEmi: "—",
              ),

              const SizedBox(height: 18),

              _loanCard(
                context: context,
                loanId: "SLF25400012",
                amount: "₹ 1,95,000",
                weight: "100g",
                loanDate: "10 Dec 2024",
                nextEmi: "—",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------- LOAN CARD WIDGET ---------------------
  Widget _loanCard({
    required BuildContext context,
    required String loanId,
    required String amount,
    required String weight,
    required String loanDate,
    required String nextEmi,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LoanDetailsScreen()),
        );

        debugPrint("Clicked Loan: $loanId");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row → Loan ID + Active Badge
              Row(
                children: [
                  Text(
                    "Loan ID - $loanId",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
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

              const SizedBox(height: 10),

              // Amount
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              // 2-Column Info (Left / Right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Gold Weight :",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        weight,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Loan Date :",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        loanDate,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              nextEmi == "—"
                  ? const SizedBox()
                  : Text(
                      "Next EMI :   $nextEmi",
                      style: const TextStyle(color: Colors.black87),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
