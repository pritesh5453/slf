import 'package:flutter/material.dart';
import 'package:slf/components/enter_amount.dart';

class LoanDetailsScreen extends StatelessWidget {
  final String loanId;
  final String userName;

  const LoanDetailsScreen({
    super.key,
    this.loanId = "SLF25402158",
    this.userName = "Pritesh Pawar",
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const CircleAvatar(
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

              // ---------- TITLE CARD ----------
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
                          onTap: () => Navigator.pop(context),
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

              // ---------- MAIN DETAILS ----------
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
                      const Text(
                        "₹ 1,50,000",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Labels
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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

                          // Values
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showGoldDetailsPopup(context);
                                  },
                                  child: const Text(
                                    "800 g",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "15 Jan 2025",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "12 Months",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Total Paid + Progress Bar
                      const Text(
                        "Total Paid",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: const [
                          Text(
                            "₹ 133,250",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text(
                            "Of ₹ 159,900",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: 0.85,
                          minHeight: 10,
                          backgroundColor: const Color(0xFFECECEC),
                          valueColor: AlwaysStoppedAnimation(Color(0xFF022A7C)),
                        ),
                      ),

                      const SizedBox(height: 8),

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

                      // EMI Due box
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
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Next EMI Due",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "15th Nov 2025",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
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

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => _showPaymentSheet(context),
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
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 🔥 POPUP FUNCTION — EXACT SAME POPUP YOU REQUESTED
  // ---------------------------------------------------------------------------
  void _showGoldDetailsPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Close Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 24),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/gold_image.png",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TABLE
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.black12),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(2.2),
                        1: FlexColumnWidth(2.2),
                        2: FlexColumnWidth(2.2),
                        3: FlexColumnWidth(1.5),
                      },
                      children: const [
                        TableRow(
                          decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
                          children: [
                            _tableCell("Products", bold: true),
                            _tableCell("Gross Weight", bold: true),
                            _tableCell("Net Weight", bold: true),
                            _tableCell("Purity", bold: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableCell("Necklace"),
                            _tableCell("500 g"),
                            _tableCell("480 g"),
                            _tableCell("22 K"),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableCell("Earrings"),
                            _tableCell("150 g"),
                            _tableCell("145 g"),
                            _tableCell("20 K"),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableCell("Bangles"),
                            _tableCell("150 g"),
                            _tableCell("140 g"),
                            _tableCell("20 K"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Remark
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Remark :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "4 Stones were missing from Bangles",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// --------------------------- TABLE CELL WIDGET ----------------------------
class _tableCell extends StatelessWidget {
  final String text;
  final bool bold;
  const _tableCell(this.text, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

void _showPaymentSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          int selected = 1; // 1 = pay total, 2 = pay minimum, 3 = custom

          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CLOSE BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 24),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ---------------- OPTION 1 ----------------
                  GestureDetector(
                    onTap: () => setState(() => selected = 1),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selected == 1 ? Colors.blue : Colors.black26,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: selected,
                            activeColor: Colors.blue,
                            onChanged: (v) => setState(() => selected = 1),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "Pay total",
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          const Text(
                            "₹ 80,000",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ---------------- OPTION 2 ----------------
                  GestureDetector(
                    onTap: () => setState(() => selected = 2),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selected == 2 ? Colors.blue : Colors.black26,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: selected,
                            activeColor: Colors.blue,
                            onChanged: (v) => setState(() => selected = 2),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "Pay minimum",
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          const Text(
                            "₹ 25,000",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ---------------- OPTION 3 (Custom) ----------------
                  GestureDetector(
                    onTap: () => setState(() => selected = 3),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selected == 3 ? Colors.blue : Colors.black26,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: selected,
                            activeColor: Colors.blue,
                            onChanged: (v) => setState(() => selected = 3),
                          ),
                          const SizedBox(width: 6),
                          const Expanded(
                            child: Text(
                              "Enter other amount",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // If custom amount selected → TextField show
                  if (selected == 3)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter amount",
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  // PAY NOW BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterAmountScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B2B66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
