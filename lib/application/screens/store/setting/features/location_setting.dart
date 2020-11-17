
import 'package:flutter/material.dart';

class LocationSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Setting')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200.0,
                  child: Text(
                    'Location Goes Here',
                    overflow: TextOverflow.clip,
                  ),
                ),
                RaisedButton(
                  onPressed: () => print('updating'),
                  child: Text('Update'),
                )
              ],
            ),
          ),
          Divider(height: 0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () => print('Saving...'),
              child: Text(
                'Save',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
