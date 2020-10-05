import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ReusableCard({
    Key key,
    this.title,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
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
