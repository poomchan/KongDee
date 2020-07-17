import 'package:flutter/material.dart';

class AppOnboardingPage extends StatefulWidget {
  @override
  _AppOnboardingPageState createState() => _AppOnboardingPageState();
}

class _AppOnboardingPageState extends State<AppOnboardingPage> {
  buildIntroductionPage() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: <Widget>[
          buildIntroductionPage(),
        ],
      ),
    );
  }
}
