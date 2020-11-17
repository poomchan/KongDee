import 'package:flutter/material.dart';

class FlexibleTopLeftMargin extends StatelessWidget {
  final Widget child;

  const FlexibleTopLeftMargin({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(),
        ),
        Flexible(
          flex: 15,
          child: Row(
            children: [
              Flexible(
                child: Container(),
              ),
              Flexible(
                flex: 30,
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
