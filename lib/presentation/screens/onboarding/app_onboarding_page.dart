import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/location/permission/location_permission_cubit.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';
import 'package:universal_platform/universal_platform.dart';

class AppOnboardingPage extends StatefulWidget {
  final int initPage;

  const AppOnboardingPage({Key key, this.initPage = 0}) : super(key: key);
  @override
  _AppOnboardingPageState createState() => _AppOnboardingPageState();
}

class _AppOnboardingPageState extends State<AppOnboardingPage> {
  PageController _pageViewController;
  final int _totalPages = 3;
  int _pageIndex = 0;

  @override
  void initState() { 
    super.initState();
    _pageViewController = PageController(initialPage: widget.initPage);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationPermissionCubit, LocationPermissionState>(
      listener: (context, state) {
        // if permission granted => navigate to the home page
        // otherwise, stay on the onboarding page
        state.maybeMap(
          granted: (_) => context.navigator
              .pushAndRemoveUntil(Routes.homePage, (route) => false),
          orElse: () => null,
        );
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: (int page) {
                setState(() {
                  _pageIndex = page;
                });
              },
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
                        Container(
                          child: Row(children: [
                            for (int i = 0; i < _totalPages; i++)
                              i == _pageIndex
                                  ? _buildPageIndicator(true)
                                  : _buildPageIndicator(false)
                          ]),
                        ),
                        const Spacer(),
                        if (_pageIndex != 2)
                          GestureDetector(
                            onTap: () {
                              _pageViewController.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.fastOutSlowIn);
                              setState(() {});
                            },
                            child: Container(
                              height: UniversalPlatform.isIOS ? 70 : 60,
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
                        if (_pageIndex == 2)
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<LocationPermissionCubit>(
                                        context)
                                    .requestLocationPermission(),
                            child: Container(
                              height: UniversalPlatform.isIOS ? 70 : 60,
                              alignment: Alignment.center,
                              child: const Text(
                                'Start Now!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
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
                padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                      onPressed: () =>
                          BlocProvider.of<LocationPermissionCubit>(context)
                              .requestLocationPermission(),
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

  Widget buildGrantLocationButton() {
    return GestureDetector(
      onTap: () {
        _pageViewController.animateToPage(2,
            duration: const Duration(milliseconds: 400), curve: Curves.linear);
        setState(() {});
      },
      child: Container(
        height: UniversalPlatform.isIOS ? 70 : 60,
        alignment: Alignment.center,
        child: const Text(
          'Skip',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}
