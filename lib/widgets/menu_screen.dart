import 'package:flutter/material.dart';
import 'package:slf/model/menuModel.dart';
import 'package:slf/utils/global.dart'; // menuUser

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
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
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

    // 🔥 Get global menu user
    final MenuCustomer? user = menuUser;

    return Drawer(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: Colors.black.withOpacity(0.10)),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: _slideAnimation,
              child: Material(
                elevation: 10,
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: SizedBox(
                  width: w * 0.82,
                  child: SafeArea(
                    child: Column(
                      children: [
                        // ----------------------------------------------------
                        // HEADER
                        // ----------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 26,
                                backgroundImage: user?.profileImage != null
                                    ? NetworkImage(user!.profileImage!)
                                    : const AssetImage(
                                            "assets/images/profile.png",
                                          )
                                          as ImageProvider,
                              ),
                              const SizedBox(width: 10),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "ID : ${user?.id ?? "-"}",
                                    style: const TextStyle(
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

                        // ----------------------------------------------------
                        // MENU TILES
                        // ----------------------------------------------------
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
                                  _personalDetailsCard(user),

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

  // --------------------------------------------------------
  // PERSONAL DETAILS CARD
  // --------------------------------------------------------
  Widget _personalDetailsCard(MenuCustomer? user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _readonlyField(user?.printName ?? ""), // Full name
          _readonlyField("+91 ${user?.mobile ?? ""}"), // Mobile
          _readonlyField(user?.email ?? ""), // Email
          _readonlyField(user?.dob?.split("T").first ?? ""), // DOB
          _readonlyField(user?.permanentAddress ?? "Not Available"), // Address
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

  // --------------------------------------------------------
  // MENU TILE
  // --------------------------------------------------------
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

  // --------------------------------------------------------
  // CONTACT US CARD
  // --------------------------------------------------------
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

  // --------------------------------------------------------
  // SETTINGS CARD
  // --------------------------------------------------------
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

  // --------------------------------------------------------
  // READONLY FIELD
  // --------------------------------------------------------
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
