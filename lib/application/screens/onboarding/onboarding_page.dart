import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/onboarding/bloc/onboarding_bloc.dart';

class OnboardingPage extends ViewWidget<OnboardingBloc> {
  final int initPage;

  const OnboardingPage({Key key, this.initPage = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: bloc.pageController,
            children: <Widget>[
              buildIPageContent(
                body: 'Easy to buy and sell anything nearby\nNo commision.',
                backgroundColor: const Color(0x9F3C60FF),
                svgName: 'food',
              ),
              buildIPageContent(
                body: 'Realtime chat with your own deal',
                backgroundColor: const Color(0xFFFFA131),
                svgName: 'men',
              ),
              buildIPageContent(
                body: 'Turn on location to find nearby people',
                backgroundColor: const Color(0xFFFF7252),
                svgName: 'location2',
                isAskingPermission: true,
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width * .05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Row(
                    children: [
                      for (int i = 0; i < bloc.totalPages; i++)
                        i == bloc.pageController.page
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                      const Spacer(),
                      if (bloc.pageController.page != 2)
                        GestureDetector(
                          onTap: () => bloc.pageController.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.fastOutSlowIn,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      if (bloc.pageController.page == 2)
                        GestureDetector(
                          onTap: () => bloc.requestLocationPermission(),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Start Now!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIPageContent({
    String body = 'body',
    bool isAskingPermission = false,
    Color backgroundColor = Colors.black12,
    @required String svgName,
  }) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Flexible(
              child: Container(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  body,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            Flexible(
              child: isAskingPermission
                  ? RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'Grant Location',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 20.0),
                      ),
                      onPressed: () => bloc.requestLocationPermission(),
                    )
                  : SizedBox(height: 1.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 18.0 : 10.0,
      width: isCurrentPage ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
