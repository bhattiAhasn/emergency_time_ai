//
// class DrawerTileWidget extends StatelessWidget {
//   const DrawerTileWidget({super.key,required this.leading, required this.title, this.onTap});
//   final Widget leading;
//   final String title;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       minVerticalPadding: 5,
//       onTap: onTap,
//       leading: SizedBox(
//         height: 18,
//         width: 20,
//         child: leading),
//       title: Text(title,  style: const TextStyle(
//         fontFamily: 'Nexa',
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: AppColors.color434343,
//       ),),
//     );
//   }
// }