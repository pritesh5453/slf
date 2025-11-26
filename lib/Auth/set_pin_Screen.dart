import 'package:flutter/material.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  List<String> pin = [];

  void addDigit(String digit) {
    if (pin.length < 4) {
      setState(() {
        pin.add(digit);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF022A7C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ---------- TAB BAR ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Set Pin",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Set Face ID",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ---------- TEXT ----------
            const Text(
              "Set your PIN for easy and quick login",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),

            const SizedBox(height: 25),

            // ---------- PIN DOTS ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: index < pin.length
                        ? Colors.white
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ---------- NUMBER KEYPAD ----------
            Wrap(
              spacing: 35,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                buildCircleButton("1"),
                buildCircleButton("2"),
                buildCircleButton("3"),
                buildCircleButton("4"),
                buildCircleButton("5"),
                buildCircleButton("6"),
                buildCircleButton("7"),
                buildCircleButton("8"),
                buildCircleButton("9"),
                const SizedBox(width: 70),
                buildCircleButton("0"),
              ],
            ),

            const Spacer(),

            // ---------- CONTINUE BUTTON ----------
            SizedBox(
              width: width * 0.75,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4B400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text("Skip for now", style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  // ----------- Round Keypad Button -------------
  Widget buildCircleButton(String value) {
    return GestureDetector(
      onTap: () => addDigit(value),
      child: Container(
        height: 62,
        width: 62,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
