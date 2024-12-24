import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "images/profile_background.png",
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Column(
            children: [
              // Header Section
              SizedBox(
                height: size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/profile.png"),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "john.doe@example.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              // Profile Details Section
              Expanded(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Account Section
                          _sectionHeader("Account"),
                          const SizedBox(height: 10),
                          _actionTile("My Orders", Icons.shopping_bag, () {
                            // Navigate to Orders Page
                          }),
                          _actionTile("Wishlist", Icons.favorite_border, () {
                            // Navigate to Wishlist Page
                          }),
                          _actionTile("My Addresses", Icons.location_on, () {
                            // Navigate to Address Page
                          }),
                          _actionTile("Payment Methods", Icons.payment, () {
                            // Navigate to Payment Methods Page
                          }),
                          const SizedBox(height: 20),

                          // Settings Section
                          _sectionHeader("Settings"),
                          const SizedBox(height: 10),
                          _actionTile("Profile Settings", Icons.person, () {
                            // Navigate to Profile Settings
                          }),
                          _actionTile("Notifications", Icons.notifications, () {
                            // Navigate to Notifications Page
                          }),
                          _actionTile("Help & Support", Icons.help_outline, () {
                            // Navigate to Help Page
                          }),
                          const SizedBox(height: 20),

                          // Logout Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle Logout
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section Header Widget
  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  // Action Tile Widget
  Widget _actionTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
