

import 'package:emergency_time/widgets/common_textstyle/common_text_style.dart';

import '../../../utils/libraries/app_libraries.dart';

class ReviewCommentsTile extends StatelessWidget {
  
  final String rating;
  final String comment;
  final String user;
  final String date;
  final String userProfile;
  
  const ReviewCommentsTile({super.key, required this.rating, required this.comment, required this.user, required this.date, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.green, size: 20),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(rating, style: CommonTextStyle.titleHeading,),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(comment, style: CommonTextStyle.titleHeading.copyWith(fontSize: 16),),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 20,
            child: Image.asset(userProfile),
          ),
          title: Text(user, style: CommonTextStyle.titleHeading),
          subtitle: Text(date, style: CommonTextStyle.grey12Text),
        )
      ],
    );
  }
}
