import '../../../../utils/libraries/app_libraries.dart';

class ContactsTextfield extends StatelessWidget {
  const ContactsTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.contacts, color: Colors.grey,),
          hintText: 'Invite You Friend',
          hintStyle: TextStyle(
              color: Colors.grey,
              letterSpacing: 0.4,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Gilroy'
          ),
        ),
      ),
    );
  }
}
