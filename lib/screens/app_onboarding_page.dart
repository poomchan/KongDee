import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/bloc/permission/permission_bloc.dart';

class AppOnboardingPage extends StatefulWidget {
  @override
  _AppOnboardingPageState createState() => _AppOnboardingPageState();
}

class _AppOnboardingPageState extends State<AppOnboardingPage> {
  var _pageViewController = PageController(initialPage: 0);
  int _totalPages = 3;
  int _pageIndex = 0;
  buildIPageContent(
      {String body = 'body',
      bool isAskingPermission = false,
      Color backgroundColor = Colors.black12}) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('picture goes here'),
            SizedBox(
              height: 20.0,
            ),
            Text(
              body,
              style: TextStyle(color: Colors.black),
            ),
            if (isAskingPermission)
              FlatButton(
                child: Text(
                  'Grant Location',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () => BlocProvider.of<PermissionBloc>(context).add(
                  LocationPermissionRequested(),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 18.0 : 10.0,
      width: isCurrentPage ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageViewController,
            onPageChanged: (int page) {
              setState(() {
                _pageIndex = page;
              });
            },
            children: <Widget>[
              buildIPageContent(
                  body: 'This app is the best',
                  backgroundColor: Color(0xFFFF7252)),
              buildIPageContent(
                  body: 'Really the best', backgroundColor: Color(0xFFFFA131)),
              buildIPageContent(
                  body: 'please grant the permission',
                  backgroundColor: Color(0xFF3C60FF),
                  isAskingPermission: true),
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
                      Spacer(),
                      if (_pageIndex != 2)
                        GestureDetector(
                          onTap: () {
                            _pageViewController.animateToPage(2,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                            setState(() {});
                          },
                          child: Container(
                            height: Platform.isIOS ? 70 : 60,
                            alignment: Alignment.center,
                            child: Text(
                              'Skip',
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
                              BlocProvider.of<PermissionBloc>(context).add(
                            LocationPermissionRequested(),
                          ),
                          child: Container(
                            height: Platform.isIOS ? 70 : 60,
                            alignment: Alignment.center,
                            child: Text(
                              'Start',
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
    );
  }
}
