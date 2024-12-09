import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/appointment_screen/appointment_screen.dart';
import 'package:emergency_time/views/settings_screen/settings_screen.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.5,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Profile Info
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.visitDr1, // Replace with your own image
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const MyText(
                    'Bernarr Dominik',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  const MyText(
                    '+91 98765 43210',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(
                    onTap: () {
                      Get.to(() => const AppointmentScreen());
                    },
                    icon: Icons.calendar_today,
                    title: 'Appointments',
                  ),
                  DrawerItem(
                    onTap: () {},
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                  ),
                  const DrawerItem(
                    icon: Icons.medical_services,
                    title: 'Test Bookings',
                  ),
                  const DrawerItem(
                    icon: Icons.phone_in_talk,
                    title: 'eConsultation',
                  ),
                  const DrawerItem(
                    icon: Icons.policy,
                    title: 'My Policies',
                  ),
                  const DrawerItem(
                    icon: Icons.notifications_active,
                    title: 'Reminders',
                  ),
                  // DrawerItem(
                  //   icon: Icons.account_balance_wallet,
                  //   title: 'Wallet',
                  //   trailing: Text(
                  //     '₹5,100',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  DrawerItem(
                    icon: Icons.local_hospital,
                    title: 'My Doctors',
                  ),
                ],
              ),
            ),

            // Footer
            const Divider(),
            ListTile(
              onTap: () {
                Get.to(() => const SettingsScreen());
              },
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const MyText(
                'Settings',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.support_agent,
                color: Colors.black,
              ),
              title: MyText(
                '24x7 Help',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: MyText(
                'About us',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap; // Add an onTap parameter

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap, // Initialize onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      title: MyText(
        title,
        fontSize: 15,
        color: Colors.black,
        // fontWeight: FontWeight.bold,
      ),
      trailing: trailing,
      onTap: onTap ?? () {}, // Use onTap if provided, otherwise do nothing
    );
  }
}
