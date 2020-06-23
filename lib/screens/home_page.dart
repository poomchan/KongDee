import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/screens/liked_page.dart';
import 'package:fluttertaladsod/screens/posting_page.dart';
import 'package:fluttertaladsod/screens/profile_page.dart';
import 'package:fluttertaladsod/screens/activity_page.dart';
import 'package:fluttertaladsod/screens/shopping_page.dart';
import 'package:fluttertaladsod/services/auth_service.dart';
import 'package:fluttertaladsod/services/image_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);

    // listen for Google sign in by subscribe to the stream
    // it's automatically disposed when the app finished
    authService.loginListener(context);
    // log user in silently
    authService.loginSilently(context);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
    _pageController.animateToPage(_pageIndex,
        duration: Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
  }

  handleNavBarSelection(selectedIndex) async {
    List<Asset> postingImages = [];
    // user select posting page
    if (selectedIndex == 2) {
      // let user select images
      await imageService.getMultiImages(onGetImages: (pickedImages) {
        Provider.of<LocalStateStorage>(context, listen: false)
            .setPostingImages(pickedImages);

        postingImages.addAll(pickedImages);
      });

      // if user picked images => go to the posting page
      if (postingImages.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostingPage(),
          ),
        );
      }
    } else {
      // otherwise remain in on the previous page
      changePage(selectedIndex);
    }
  }

  handleInitializeAppState() {
    dbService.fetchAppState(context);
  }

  buildAuthScreen() {
    handleInitializeAppState();

    var currentUser =
        Provider.of<NetworkStateStorage>(context, listen: false).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Stuff'),
        actions: <Widget>[
          _pageIndex == 0
              ? Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.search),
                    onPressed: () => print('searching'),
                  ),
                )
              : Container(),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          ShoppingPage(),
          LikedPage(),
          Container(),
          ActivityPage(),
          ProfilePage(currentUser?.id),
        ],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int pageIndex) {
          setState(() {
            _pageIndex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Saved'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text('New Post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (selectedIndex) => handleNavBarSelection(selectedIndex),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  buildUnAuthScreen() {
    setState(() {
      _pageIndex = 0;
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withAlpha(1500),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: authService.loginWithGoogle,
              child: Text(
                'Login with Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // this makes sure that the user data is not null before beginning to use the app
    User authUser = Provider.of<NetworkStateStorage>(context).currentUser;
    Provider.of<NetworkStateStorage>(context, listen: false)
        .setIsAuth(authUser != null);
    bool loggedIn = Provider.of<NetworkStateStorage>(context).isAuth;
    return loggedIn ? buildAuthScreen() : buildUnAuthScreen();
  }
}
