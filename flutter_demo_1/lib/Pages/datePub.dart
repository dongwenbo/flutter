import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePubDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DatePubDemoState();
  }
}
const String MIN_DATETIME = '2019-05-15 09:23:10';
const String MAX_DATETIME = '2019-06-03 21:11:00';
const String INIT_DATETIME = '2019-05-16 09:00:00';

class DatePubDemoState extends State<StatefulWidget> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 12, minute: 12);
  String _format = 'yy年M月d日    EEE,H时:m分';
  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  bool _showTitle = true;

  _showDate() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      locale: _locale,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
      ),
      pickerMode: DateTimePickerMode.datetime, // show TimePicker
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DateDemo"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                child: Row(children: <Widget>[
                  Text(formatDate(this._dateTime, [yyyy, '-', mm, '-', dd, ' ', HH, '时', nn, '分'])),
                  Icon(Icons.arrow_drop_down)
                ],),
                onTap: this._showDate,
              ),
            ],
          )
        ],
      ),
    );
  }
}