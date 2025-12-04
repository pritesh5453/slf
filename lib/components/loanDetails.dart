import 'package:flutter/material.dart';
import 'package:slf/components/notification.dart';
import 'package:slf/model/activeloans.dart';

class LoanDetailsScreen extends StatelessWidget {
  final String loanId;
  final String userName;
  final String amount;
  final String goldWeight;
  final String startDate;
  final String tenure;
  final String totalPaid;

  final List<PledgeItem> pledgeItems;
  final String remark;
  final String ornamentPhoto;

  const LoanDetailsScreen({
    super.key,
    required this.loanId,
    required this.userName,
    required this.amount,
    required this.goldWeight,
    required this.startDate,
    required this.tenure,
    required this.totalPaid,
    required this.pledgeItems,
    required this.remark,
    required this.ornamentPhoto,
  });

  String cleanAmount(String value) {
    return value.replaceAll("₹", "").replaceAll(",", "").trim();
  }

  @override
  Widget build(BuildContext context) {
    final doubleAmount = double.tryParse(cleanAmount(amount)) ?? 0;
    final doublePaid = double.tryParse(cleanAmount(totalPaid)) ?? 0;

    double progress = doubleAmount > 0
        ? (doublePaid / doubleAmount).clamp(0, 1)
        : 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER -----------------------------------------
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

              const SizedBox(height: 14),

              // TITLE CARD -------------------------------------
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

              // MAIN CARD -------------------------------------
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
                      Text(
                        "₹ ${cleanAmount(amount)}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Loan info rows ----------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => _showGoldPopup(context),
                                  child: Text(
                                    "$goldWeight g",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  startDate,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  tenure,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "Total Paid",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(
                            "₹ ${cleanAmount(totalPaid)}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "Of ₹ ${cleanAmount(amount)}",
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 10,
                          backgroundColor: const Color(0xFFECECEC),
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xFF022A7C),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Static EMI Box ---------------------------
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

  // POPUP ==============================================================
  void _showGoldPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 28),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      ornamentPhoto,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        "assets/images/gold_image.png",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TABLE -----------------------------------------
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: const BorderSide(color: Colors.black12),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(2.5),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(1.5),
                      },
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
                          children: [
                            _TableCell("Products", bold: true),
                            _TableCell("Gross", bold: true),
                            _TableCell("Net", bold: true),
                            _TableCell("Purity", bold: true),
                          ],
                        ),
                        ...pledgeItems.map((item) {
                          return TableRow(
                            children: [
                              _TableCell(item.particular ?? "-"),
                              _TableCell("${item.gross ?? 0} g"),
                              _TableCell("${item.netWeight ?? 0} g"),
                              _TableCell(item.purity ?? "-"),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Remark :",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      remark.isNotEmpty ? remark : "No remark available",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// -------------------------------------------
class _TableCell extends StatelessWidget {
  final String text;
  final bool bold;

  const _TableCell(this.text, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}
