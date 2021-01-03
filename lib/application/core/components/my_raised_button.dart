import 'package:flutter/material.dart';

class MyRaisedButton extends RaisedButton {
  const MyRaisedButton({
    @required this.onClicked,
    this.child,
  }) : super(
          onPressed: onClicked,
          elevation: 0.0,
          child: child,
        );

  final VoidCallback onClicked;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        buttonColor: Theme.of(context).accentColor,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.white,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
      ),
      child: Builder(builder: super.build),
    );
  }
}
