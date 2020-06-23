import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/back_button.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/constant.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/services/location_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PostingPage extends StatefulWidget {
  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  // TODO: Don't let user pop back using dragging, using onWillPop to warn the user
  bool _isUploading = false;

  // for uploading
  String _imageCaption;
  String _category = 'select category';
  String _formattedAddress;
  Map<String, Object> _geoPoint;

  @override
  void initState() {
    super.initState();
    handleGetLocation();
  }

  handleGetLocation() async {
    setState(() {
      // set to null to show loading indicator
      _formattedAddress = null;
    });
    await locationService.getUserLocation();
    setState(() {
      _formattedAddress = locationService.formattedAddress;
      _geoPoint = locationService.geoPoint;
    });
  }

  buildImageView(List<Asset> postingImages) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(postingImages.length, (index) {
          Asset asset = postingImages[index];
          return Padding(
            padding: EdgeInsets.all(1.0),
            child: AssetThumb(
              asset: asset,
              width: 200,
              height: 200,
            ),
          );
        }),
      ),
    );
  }

  buildCircleAvatar(BuildContext context, User user) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.white70,
      backgroundImage: CachedNetworkImageProvider(
          user.photoURL ?? "https://via.placeholder.com/150"),
    );
  }

  buildPostHeader(User user) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          buildCircleAvatar(context, user),
          SizedBox(width: 10.0),
          Text(
            user.displayName,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildCaptionField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        onChanged: (input) {
          setState(() {
            _imageCaption = input;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Say something about your product...',
          focusedBorder: InputBorder.none,
        ),
        // only show 1 line
        minLines: 1,
        // but can expand to 4 lines
        maxLines: 4,
      ),
    );
  }

  buildDropDownMenu() {
    List<String> categoryList =
        Provider.of<NetworkStateStorage>(context).categoryList;

    return DropdownButton<String>(
      value: _category,
      icon: Icon(Icons.arrow_forward_ios),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(color: kBeautifulBlackColor),
      underline: Container(
        height: 0,
        color: Colors.white70,
      ),
      onChanged: (String newValue) {
        setState(() {
          _category = newValue;
        });
      },
      items: categoryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  buildSelectCategory() {
    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Product Category'),
          buildDropDownMenu(),
        ],
      ),
    );
  }

  buildShowAddress() {
    if (_formattedAddress == null) {
      return CupertinoActivityIndicator();
    }
    return Flexible(
      child: Text(
        _formattedAddress,
        style: TextStyle(
          color: kBeautifulBlackColor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  buildSelectLocation() {
    return GestureDetector(
      onTap: handleGetLocation,
      child: Container(
        padding:
            EdgeInsets.only(right: 15.0, left: 15.0, top: 17.0, bottom: 17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Selling Location'),
            SizedBox(
              width: 20.0,
            ),
            buildShowAddress(),
          ],
        ),
      ),
    );
  }

  handleUploadPost(List<Asset> postingImages) async {
    // define necessary variables
    List<String> imageUrls = [];
    String postId = Uuid().v4();

    setState(() {
      _isUploading = true;
    });

    // upload images to Firebase storage
    for (Asset image in postingImages) {
      String mediaUrl =
          await dbService.uploadAssetImage(assetImage: image, postId: postId);
      imageUrls.add(mediaUrl);
    }

    // create a new post in firestore
    dbService.uploadPostInFirestore(
      postId: postId,
      mediaUrl: imageUrls,
      caption: _imageCaption,
      category: _category,
      formattedLocation: _formattedAddress,
      geoPoint: _geoPoint,
    );

    setState(() {
      _isUploading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<NetworkStateStorage>(context).currentUser;
    List<Asset> postingImages =
        Provider.of<LocalStateStorage>(context).postingImages;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Post',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: _isUploading ? null : MyBackButton(),
        actions: <Widget>[
          FlatButton(
            onPressed:
                _isUploading ? null : () => handleUploadPost(postingImages),
            child: Text(
              'Post',
              style: TextStyle(
                  color: _isUploading
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  fontSize: 18.0),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _isUploading ? linearProgress(context) : Container(),
            Divider(height: 0),
            buildPostHeader(user),
            buildCaptionField(),
            buildImageView(postingImages),
            Divider(height: 0),
            buildSelectCategory(),
            Divider(height: 0),
            buildSelectLocation(),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
