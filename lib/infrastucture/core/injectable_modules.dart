
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart' as _code;
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

abstract class InjectableModule {
  /// Firebase
  GoogleSignIn get googleSignIn => GoogleSignIn();
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  StorageReference get firebaseStorage => FirebaseStorage.instance.ref();
  
  /// Location
  Geoflutterfire get geoFlutterFire => Geoflutterfire();
  Location get location => Location.instance;
  _code.GeocodingPlatform get geocoding => _code.GeocodingPlatform.instance;

  /// Image
  ImagePicker get imagePicker => ImagePicker();
}
