import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/constant.dart';
import 'package:fluttertaladsod/model/activity.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<NetworkStateStorage>(context).currentUser;

    return FutureBuilder(
      future: dbService.userRef
          .document(currentUser.id)
          .collection('activity')
          .orderBy('timestamp', descending: true)
          .limit(10)
          .getDocuments(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }
        List<Activity> activity = snapshot.data.documents
            .map((DocumentSnapshot doc) => Activity.fromFirestoreDocument(doc))
            .toList();

        if (activity.isEmpty) {
          return Center(
              child: Text(
            'No activity ;)',
            style: TextStyle(color: kBeautifulBlackColor),
          ));
        }

        return Container(
          child: ListView(
            children: activity,
          ),
        );
      },
    );
  }
}
