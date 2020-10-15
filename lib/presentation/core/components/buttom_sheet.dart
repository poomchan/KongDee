import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showAppButtomSheet(BuildContext context, {List<Widget> children}) {
  showCupertinoModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    builder: (context, controller) => Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              children: children,
            ),
          ),
          const SizedBox(height: 20.0),
          ButtomSheetItem(
            title: 'Cancel',
            color: Colors.blue,
            isStadium: true,
            onTap: () => ExtendedNavigator.of(context).pop(),
          )
        ],
      ),
    ),
  );
}

class ButtomSheetItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function() onTap;
  final bool isStadium;

  const ButtomSheetItem({
    Key key,
    @required this.title,
    this.icon,
    this.color = Colors.black,
    @required this.onTap,
    this.isStadium = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      shape: isStadium
          ? StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
      elevation: 0.0,
      highlightElevation: 0.0,
      splashColor: Colors.transparent,
      fillColor: Colors.white,
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: color,
                )
              : Container(),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontSize: 15.0, color: color, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
