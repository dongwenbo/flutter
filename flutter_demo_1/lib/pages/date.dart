import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DateDemoState();
  }
}

class DateDemoState extends State<StatefulWidget> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 12, minute: 12);

  _showDate() async {
    var result = await showDatePicker(context: context,
        initialDate: this.date,
        firstDate: DateTime(1971),
        lastDate: DateTime(2222),);
    setState(() {
      if (result != null) {
        this.date = result;
      }
    });
  }

  _showTime() async {
    var result = await showTimePicker(context: context, initialTime: this.time);
    setState(() {
      if (result != null) {
        this.time = result;
      }
    });
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
                  Text(formatDate(this.date, [yyyy, '-', mm, '-', dd])),
                  Icon(Icons.arrow_drop_down)
                ],),
                onTap: this._showDate,
              ),
              InkWell(
                child: Row(children: <Widget>[
                  Text(this.time.format(context)),
                  Icon(Icons.arrow_drop_down)
                ],),
                onTap: this._showTime,
              ),
            ],
          )
        ],
      ),
    );
  }
}