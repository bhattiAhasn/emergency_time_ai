import '../../../../utils/libraries/app_libraries.dart';

class SettingTile extends StatelessWidget {
  final String leading;
  final String title;
  final void Function()? onTap;

  const SettingTile(
      {super.key, required this.leading, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(leading),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: 0.4,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Gilroy',
        ),
        // CommonTextStyle.settingTitleText,
      ),
      onTap: () {},
    );
  }
}

/*
class SettingTile extends StatelessWidget {
  const DrawerTileWidget({super.key,required this.leading, required this.title, this.onTap});
  final Widget leading;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 5,
      onTap: onTap,
      leading: SizedBox(
        height: 18,
        width: 20,
        child: leading),
      title: Text(title,  style: const TextStyle(
        fontFamily: 'Nexa',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.color434343,
      ),),
    );
  }
}*/
