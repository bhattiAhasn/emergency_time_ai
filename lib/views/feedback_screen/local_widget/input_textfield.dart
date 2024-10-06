import '../../../utils/libraries/app_libraries.dart';

class InputTextfield extends StatelessWidget {
  const InputTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        maxLines: 3,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: 'Please specify in details',
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightGreyTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightGreyTextColor),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
            letterSpacing: 0.4,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
    );
  }
}
