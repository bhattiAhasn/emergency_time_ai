import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class FindDoctorsScreen extends StatelessWidget {
  const FindDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(
          'Find Doctors',
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            buildSearchField(),
            const SizedBox(height: 16.0),
            // Title
            const Text(
              'Search by Speciality',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Grid of Specialties
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: specialties.length,
                itemBuilder: (context, index) {
                  final specialty = specialties[index];
                  return SpecialtyCard(
                    icon: specialty['icon'],
                    title: specialty['title'],
                    count: specialty['count'],
                  );
                },
              ),
            ),
            // Search More Button
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle Search More action
                },
                child: const Text(
                  "Didn't find what you're looking for?\nSearch More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
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

class SpecialtyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;

  const SpecialtyCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.red,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              '$count Specialists',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSearchField() {
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

// Sample Data for Specialties
final List<Map<String, dynamic>> specialties = [
  {'icon': Icons.favorite, 'title': 'Cardiology', 'count': 340},
  {'icon': Icons.child_care, 'title': 'Pediatrics', 'count': 450},
  {'icon': Icons.medication, 'title': 'Homeopathy', 'count': 450},
  {'icon': Icons.medical_services, 'title': 'General Physician', 'count': 330},
  {'icon': Icons.kitchen, 'title': 'Kidney Issues', 'count': 123},
  {'icon': Icons.psychology, 'title': 'Mental Wellness', 'count': 50},
  {'icon': Icons.store_mall_directory, 'title': 'Digestive', 'count': 145},
  {'icon': Icons.psychology, 'title': 'Cancer', 'count': 34},
  {'icon': Icons.psychology, 'title': 'Surgery', 'count': 54},
  {'icon': Icons.clean_hands, 'title': 'Dental Care', 'count': 34},
];
