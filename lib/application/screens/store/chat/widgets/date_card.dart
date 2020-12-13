import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final DateTime dateTime;
  const DateCard({Key key, @required this.dateTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final day = dateTime.day.toString();
    final month = dateTime.month.toString();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_getDay(dateTime.weekday)),
          Text('$day/$month'),
        ],
      ),
    );
  }

  String _getDay(int day) {
    switch (day) {
      case 1:
        return 'Mon.';
        break;
      case 2:
        return 'Tue.';
        break;
      case 3:
        return 'Wed.';
        break;
      case 4:
        return 'Thu.';
        break;
      case 5:
        return 'Fri.';
        break;
      case 6:
        return 'Sat.';
        break;
      case 7:
        return 'Sun.';
        break;
      default:
        return 'err';
    }
  }
}
