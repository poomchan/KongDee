import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SellingRange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selling Range')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          SettingsTile.switchTile(
            title: 'Unlimited',
            switchValue: false,
            onToggle: (bool value) {},
          ),
          Divider(
            height: 0,
          ),
          RangePicker(enable: true),
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

class RangePicker extends StatefulWidget {
  final bool enable;

  const RangePicker({Key key, @required this.enable}) : super(key: key);
  @override
  _RangePickerState createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  TextEditingController _textController;
  int range = 1;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: range.toString());
  }

  @override
  Widget build(BuildContext context) {
    return widget.enable ? Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sell in'),
            SizedBox(
              width: 100.0,
              child: TextFormField(
                  controller: _textController,
                  textAlign: TextAlign.center,
                  enableSuggestions: false,
                  enabled: widget.enable),
            ),
            Text('kilometers'),
          ],
        ),
      ),
    ) : SizedBox();
  }
}
