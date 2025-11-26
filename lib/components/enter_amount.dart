import 'package:flutter/material.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final TextEditingController _amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // avoid keyboard overflow

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- CLOSE BUTTON ----------------
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 250),

            // ---------------- TITLE ----------------
            const Text(
              "Enter Amount",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 40),

            // ---------------- INPUT FIELD ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.only(bottom: 8, left: 100),
                decoration: BoxDecoration(
                  // border: Border(
                  //   bottom: BorderSide(color: Colors.grey.shade400, width: 1),
                  // ),
                ),
                child: Row(
                  children: [
                    const Text(
                      "₹",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // TEXTFIELD
                    Expanded(
                      child: TextField(
                        controller: _amountCtrl,
                        keyboardType: TextInputType.number,
                        cursorHeight: 34,
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: "00000",
                          hintStyle: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFBDBDBD),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------- PAY NOW BUTTON ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
