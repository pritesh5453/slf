import 'package:flutter/material.dart';

class MenuSectionScreen extends StatefulWidget {
  const MenuSectionScreen({super.key});

  @override
  State<MenuSectionScreen> createState() => _MenuSectionScreenState();
}

class _MenuSectionScreenState extends State<MenuSectionScreen>
    with SingleTickerProviderStateMixin {
  String selected = "";

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2),
    );

    // LEFT SIDE SLIDE
    _slideAnimation = Tween(
      begin: const Offset(-1.0, 0.0), // Slide from left
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      // 🔥 SafeArea added HERE
      child: Stack(
        children: [
          // ---------- BACKGROUND LIGHT FADE ----------
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black.withOpacity(0.10), // light fade
            ),
          ),

          // ---------- LEFT SLIDING PANEL ----------
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: _slideAnimation,

              child: Material(
                elevation: 8,
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),

                child: Container(
                  width: w * 0.82,
                  height: double.infinity,

                  child: SafeArea(
                    // Inner SafeArea remains
                    child: Column(
                      children: [
                        // ---------------- HEADER ----------------
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                  "assets/images/profile.png",
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pritesh Pawar",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "ID : SLF-123512345",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.close, size: 26),
                              ),
                            ],
                          ),
                        ),

                        const Divider(height: 1),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // PERSONAL DETAILS
                                _menuTile(
                                  title: "Personal Details",
                                  isSelected: selected == "personal",
                                  onTap: () {
                                    setState(() {
                                      selected = selected == "personal"
                                          ? ""
                                          : "personal";
                                    });
                                  },
                                ),
                                if (selected == "personal")
                                  _personalDetailsCard(),

                                // CONTACT US
                                _menuTile(
                                  title: "Contact Us",
                                  isSelected: selected == "contact",
                                  onTap: () {
                                    setState(() {
                                      selected = selected == "contact"
                                          ? ""
                                          : "contact";
                                    });
                                  },
                                ),
                                if (selected == "contact") _contactUsCard(),

                                // SETTINGS
                                _menuTile(
                                  title: "Settings",
                                  isSelected: selected == "settings",
                                  onTap: () {
                                    setState(() {
                                      selected = selected == "settings"
                                          ? ""
                                          : "settings";
                                    });
                                  },
                                ),
                                if (selected == "settings") _settingsCard(),

                                const SizedBox(height: 20),

                                // LOG OUT
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.logout, color: Colors.red),
                                      SizedBox(width: 10),
                                      Text(
                                        "Log Out",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //--------------------------------------------------------
  // MENU TILE
  //--------------------------------------------------------
  Widget _menuTile({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            isSelected ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 26,
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  //--------------------------------------------------------
  // CARDS
  //--------------------------------------------------------
  Widget _personalDetailsCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _readonlyField("Pritesh Pawar"),
          _readonlyField("+91 9869311557"),
          _readonlyField("pritesh123@gmail.com"),
          _readonlyField("18 April 1999"),
          _readonlyField("Tidele Colony, Nashik"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Note: These details are non-editable.",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactUsCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _readonlyField("9866411117"),
          _readonlyField(
            "SLF Finance Pvt Ltd\n318, Nehru Road, Bhagirath, Nashik",
          ),
        ],
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (v) {},
            title: const Text(
              "Notification Preferences",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            title: const Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text(
              "Terms & Conditions",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  //--------------------------------------------------------
  // READONLY FIELD
  //--------------------------------------------------------
  Widget _readonlyField(String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(value),
    );
  }
}
