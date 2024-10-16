import 'package:emergency_time/utils/libraries/app_libraries.dart';

import '../../constants/app_assets/app_icon.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(AppIcons.backIcon),
          onTap: () {
            Get.back();
          },
        ),
        actions: [

        ],
      ),
    );
  }
}
