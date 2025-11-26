import 'package:flutter/material.dart';

class LoanDetailsScreen extends StatelessWidget {
  final String loanId;
  final String userName;

  const LoanDetailsScreen({
    super.key,
    this.loanId = "SLF25402158",
    this.userName = "Pritesh Pawar", // <- replaced name
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- TOP BLUE HEADER ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 42,
                left: 16,
                right: 16,
                bottom: 18,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF022A7C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Back,",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 26,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ---------- TITLE CARD (Loan ID + Active badge) ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Loan ID - $loanId",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ---------- MAIN DETAIL CARD ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Amount
                    Text(
                      "₹ 1,50,000",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Left/Right two column info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Gold Weight :",
                                style: TextStyle(color: Colors.black54),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Loan Start Date",
                                style: TextStyle(color: Colors.black54),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Tenure",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "800 g",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "15 Jan 2025",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "12 Months",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ---------- PROGRESS BAR ----------
                    const Text(
                      "Total Paid",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 6),

                    // Amounts + progress row
                    Row(
                      children: [
                        const Text(
                          "₹ 133,250",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        const Text(
                          "Of ₹ 159,900",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // progress indicator
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: 0.85, // example progress
                        minHeight: 10,
                        backgroundColor: const Color(0xFFECECEC),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFF022A7C),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // small labels
                    Row(
                      children: const [
                        Text(
                          "10 EMIs paid",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Spacer(),
                        Text(
                          "2 EMIs Left",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // ---------- EMI DUE CARD ----------
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEEFEF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Next EMI Due",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "15th Nov 2025",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "₹13,325",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // PAY BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // handle payment navigation
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B2B66),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Pay EMI",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
