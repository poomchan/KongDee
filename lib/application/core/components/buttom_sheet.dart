// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// void showAppButtomSheet(BuildContext context, {List<Widget> children = const []}) {

//   showMaterialModalBottomSheet(
//     context: context,
//     backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
//     barrierColor: Colors.black38,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//     builder: (context, controller) => Padding(
//       padding: const EdgeInsets.only(bottom: 25.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ...children,
//           const SizedBox(height: 20.0),
//           ButtomSheetItem(
//             title: 'Cancel',
//             textColor: Colors.blueAccent,
//             filledColor: Colors.white,
//             isStadium: true,
//             onTap: () => ExtendedNavigator.of(context).pop(),
//           )
//         ],
//       ),
//     ),
//   );
// }

// class ButtomSheetItem extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Color textColor;
//   final Color filledColor;
//   final Function() onTap;
//   final bool isStadium;

//   const ButtomSheetItem({
//     Key key,
//     @required this.title,
//     this.icon,
//     this.textColor = Colors.white,
//     this.filledColor = Colors.transparent,
//     @required this.onTap,
//     this.isStadium = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: RawMaterialButton(
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         shape: isStadium
//             ? StadiumBorder()
//             : RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(0.0),
//               ),
//         elevation: 0.0,
//         highlightElevation: 0.0,
//         splashColor: Colors.transparent,
//         fillColor: filledColor,
//         onPressed: onTap,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             icon != null
//                 ? Icon(
//                     icon,
//                     color: textColor,
//                   )
//                 : Container(),
//             const SizedBox(width: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 18.0, color: textColor, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
