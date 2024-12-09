import 'package:emergency_time/utils/libraries/app_libraries.dart';
import 'package:emergency_time/views/chatbot_screen/chat_bot_screen.dart';
import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/views/appointment_screen/appointment_screen.dart';
import 'package:emergency_time/views/feedback_screen/feedback_screen.dart';
import 'package:emergency_time/views/invite_friend_screen/invite_friend_screen.dart';
import 'package:emergency_time/views/notification_screen/notification_screen.dart';
import 'package:emergency_time/views/settings_screen/settings_screen.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';

import '../../routes/app_routes.dart';
import '../find_doctors_list/doctors_list_screen.dart';
import 'local_widgets/drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const SizedBox(height: 15),
            _buildHeader(context),
            const MyText(
              'Welcome back!',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff14BFFF),
            ),
            const MyText(
              'What are you looking for?',
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            _buildSearchField(),
            _buildCategoryGrid(),
            const SizedBox(height: 20),
            const _SectionTitle('Recently Visited Doctors'),
            _buildRecentlyVisitedDoctors(),
            const SizedBox(height: 20),
            buildSpecialistDoctorsSection(),
            const SizedBox(height: 20),
            buildOtherServices(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            scaffoldKey.currentState
                ?.openDrawer(); // Correctly opens the drawer
          },
          child: Image.asset(AppAssets.drawerPic, height: 24),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {
            Get.to(() => const NotificationScreen());
          },
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search doctors, medicines, hospitals...',
          hintStyle: const TextStyle(color: Color(0xff506D85)),
          prefixIcon: const Icon(Icons.search, color: Color(0xff506D85)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          filled: true,
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        InkWell(
          child: _buildCategoryCard(Image.asset(AppAssets.doctorDashboard)),
          onTap: () {
            Get.toNamed(Routes.doctorListingScreen);
          },
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.hospitalLocatorScreen);
          },
          child: _buildCategoryCard(Image.asset(AppAssets.searchHospital)),
        ),
        InkWell(
          onTap: () {
            Get.to(() => const ChatBotScreen());
          },
          child: _buildCategoryCard(Image.asset(AppAssets.aIDashboard)),
        ),
        _buildCategoryCard(Image.asset(AppAssets.diagonosticDas)),
      ],
    );
  }

  Widget _buildCategoryCard(Widget image) {
    return Card(
      color: AppColors.redSplashColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: image),
      ),
    );
  }

  Widget _buildDoctorCard(
      String name, String specialization, String imagePath) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 10),
              MyText(
                name,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              MyText(
                specialization,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xff14BFFF),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentlyVisitedDoctors() {
    return Row(
      children: [
        _buildDoctorCard('John Doe', 'Cardiologist', AppAssets.visitDr1),
        _buildDoctorCard('Diana Prince', 'Dentist', AppAssets.visitDr2),
      ],
    );
  }

  Widget buildSpecialistDoctorsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MyText(
                'Consult Specialized Doctors',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const FindDoctorsScreen());
                },
                child: const MyText(
                  'view all',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff14BFFF),
                ).marginOnly(right: 10),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              buildSpecialistCard('Cardiology', AppAssets.cardialogiLogo),
              buildSpecialistCard('Pediatrician', AppAssets.PediatricianLogo),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSpecialistCard(String title, String imagePath) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(imagePath, height: 72, width: 72),
              const SizedBox(height: 10),
              MyText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOtherServices() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            'Other Services',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          buildServiceTile(AppAssets.hospitalLocator, 'Hospital Locator'),
          buildServiceTile(AppAssets.bmiCalculator, 'BMI Calculator'),
          buildServiceTile(AppAssets.stressIndex, 'Stress Index'),
        ],
      ),
    );
  }

  Widget buildServiceTile(String image, String title) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(image, height: 30),
        title: MyText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xff1C208F),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 10,
          color: Color(0xff8BA6BB),
        ),
      ),
    );
  }

  Widget buildHealthArticleCard(String title) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyText(
          title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(
      title,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
