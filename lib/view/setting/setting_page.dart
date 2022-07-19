// ignore_for_file: must_be_immutable, depend_on_referenced_packages, non_constant_identifier_names

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Setting extends StatefulWidget {
  Setting(
      {Key? key,
      required this.subject,
      required this.task,
      required this.date,
      required this.weekday})
      : super(key: key);

  String subject;
  String task;
  DateTime date;
  String weekday;

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  final TextEditingController _decreaseday = TextEditingController();
  final TextEditingController _decreasehour = TextEditingController();
  int _decrease = 0;
  final db = tz.initializeTimeZones();
  final timezone = tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));
  var rand = math.Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('通知設定'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                title: Text('${widget.subject} ${widget.task}'),
                subtitle: Text('${widget.date.month}月'
                    '${widget.date.day}日'
                    '(${widget.weekday})'
                    '${widget.date.hour}時'
                    '${widget.date.minute}分'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(hintText: '何日前に通知しますか？'),
              keyboardType: TextInputType.number,
              controller: _decreaseday,
            ),
            TextField(
              decoration: const InputDecoration(hintText: '何時間前に通知しますか？'),
              keyboardType: TextInputType.number,
              controller: _decreasehour,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('設定'),
                  onPressed: () {
                    if (_decreasehour.text != '' || _decreaseday.text != '') {
                      if (_decreaseday.text != '') {
                        if (_decreasehour.text != '') {
                          _decrease = int.parse(_decreaseday.text) * 24 +
                              int.parse(_decreasehour.text);
                        } else {
                          _decrease = int.parse(_decreaseday.text) * 24;
                        }
                      } else {
                        _decrease = int.parse(_decreasehour.text);
                      }
                      int select = DateTime.now().compareTo(
                          widget.date.add(Duration(hours: -_decrease)));
                      if (select == -1) {
                        notify(
                            rand.nextInt(1000),
                            '${widget.subject} ${widget.task}',
                            widget.date,
                            widget.weekday,
                            _decrease);
                        Navigator.of(context).pop('set');
                      } else if (select == 0 || select == 1) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return const AlertDialog(
                                title: Align(
                                  alignment: Alignment.center,
                                  child: Text('Error!'),
                                ),
                                content: Text('通知を送る時間は現在の時間よりも1分以上先に設定してください'),
                              );
                            });
                      }
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> notify(
      int Id, String title, DateTime body, String weekday, int decrease) {
    final flnp = FlutterLocalNotificationsPlugin();
    return flnp
        .initialize(
          const InitializationSettings(
              android: AndroidInitializationSettings('@mipmap/ic_launcher')),
        )
        .then((_) => flnp.zonedSchedule(
            Id,
            title,
            '期限　'
            '${body.year}年'
            '${body.month}月'
            '${body.day}日'
            '($weekday)'
            ' ${body.hour}時'
            '${body.minute}分',
            //tz.TZDateTime.now(tz.UTC).add(Duration(seconds: decrease)),
            tz.TZDateTime.from(body, tz.local).add(Duration(hours: -decrease)),
            const NotificationDetails(
                android: AndroidNotificationDetails(
                    'channel_Name', 'channel_description',
                    importance: Importance.high, priority: Priority.high)),
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidAllowWhileIdle: true));
  }
}
