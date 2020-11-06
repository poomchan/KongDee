import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Color backgroundColor;
  final BoxBorder border;

  const ReusableCard({
    Key key,
    this.title,
    @required this.children,
    this.backgroundColor = Colors.white, this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: border,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            title == null
                ? Container()
                : Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
            ...children
          ]),
    );
  }
}
