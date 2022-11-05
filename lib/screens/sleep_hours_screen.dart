import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scaler_app/constants/app_constants.dart';
import '../constants/color_constants.dart';
import '../time_picker/src/time_range_dialog.dart';
import '../time_picker/src/utils.dart';
import '../widgets/wave_painter.dart';
import 'home_screen.dart';

class SleepHoursScreen extends StatefulWidget {
  const SleepHoursScreen({
    super.key,
  });

  @override
  State<SleepHoursScreen> createState() => _SleepHoursScreenState();
}

class _SleepHoursScreenState extends State<SleepHoursScreen> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  var startTime = "9:00";
  var endTime = "12:00";
  var totalTime;
  var minutes;

  init()
  {
    _startTime = TimeOfDay.now();
    _endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 3)));
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  showPickers() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showTimeRangePicker(
      context: context,
      start: const TimeOfDay(hour: 22, minute: 9),
      onStartChange: (start) {
        if (kDebugMode) {
          print("start time $start");
        }
      },
      onEndChange: (end) {
        if (kDebugMode) {
          print("end time $end");
        }
      },
      interval: const Duration(hours: 1),
      minDuration: const Duration(hours: 1),
      use24HourFormat: false,
      padding: 30,
      strokeWidth: 20,
      handlerRadius: 14,
      strokeColor: Colors.orange,
      handlerColor: Colors.orange[700],
      selectedColor: Colors.amber,
      backgroundColor: Colors.black.withOpacity(0.3),
      ticks: 12,
      ticksColor: Colors.white,
      snap: true,
      labels: ["12 am", "6 am", "12 pm", "6 pm"].asMap().entries.map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: -30,
      labelStyle: const TextStyle(
          fontSize: 22, color: Colors.grey, fontWeight: FontWeight.bold),
      timeTextStyle: TextStyle(
          color: Colors.orange[700],
          fontSize: 24,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      activeTimeTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 26,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.pinkColor,
        body: Column(
          children: [
            TimeRangePicker(
                start: const TimeOfDay(hour: 9, minute: 0),
                end: const TimeOfDay(hour: 12, minute: 0),
                disabledTime: TimeRange(
                    startTime: const TimeOfDay(hour: 22, minute: 0),
                    endTime: const TimeOfDay(hour: 5, minute: 0)),
                strokeWidth: 4,
                selectedColor: Colors.white,
                strokeColor: Colors.white,
                handlerColor: Colors.white,
                ticks: 24,
                ticksOffset: -7,
                ticksLength: 15,
                ticksColor: Colors.grey,
                callBack: (v, k) {
                  startTime = formatTimeOfDay(v);
                  endTime = formatTimeOfDay(k);
                  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                  var _date = dateFormat.format(DateTime.now());
                  DateTime a = DateTime.parse('$_date $startTime');
                  DateTime b = DateTime.parse('$_date $endTime');
                  var ss =
                      b.difference(a).inMinutes - b.difference(a).inHours * 60;
                  if (ss == 0) {
                    minutes = 00;
                  } else {
                    minutes = ss;
                  }
                  setState(() {
                    if (minutes == 0) {
                      totalTime = "${b.difference(a).inHours}:00";
                    } else if (minutes == 5) {
                      totalTime = "${b.difference(a).inHours}:05";
                    } else {
                      totalTime = "${b.difference(a).inHours}:$minutes";
                    }
                  });
                },
                labels: [
                  "12 am",
                  "3 am",
                  "6 am",
                  "9 am",
                  "12 pm",
                  "3 pm",
                  "6 pm",
                  "9 pm"
                ].asMap().entries.map((e) {
                  return ClockLabel.fromIndex(
                      idx: e.key, length: 8, text: e.value);
                }).toList(),
                labelOffset: 35,
                rotateLabels: false,
                padding: 60),
            const Spacer(),
            CustomPaint(
                painter: const WavePainter(),
                child: SizedBox(
                  height: 230,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.refresh,
                                size: 40,
                                color: ColorConstants.pinkColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            totalTime != null
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 25),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    startTime.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const Text(
                                                   AppConstants.bedTime,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                  height: 30,
                                                  child: VerticalDivider(
                                                    color: Colors.grey,
                                                  )),
                                              Column(
                                                children: [
                                                  Text(
                                                    endTime,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const Text(
                                                    AppConstants.wakeUp,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                  height: 30,
                                                  child: VerticalDivider(
                                                    color: Colors.grey,
                                                  )),
                                              Column(
                                                children: [
                                                  Text(
                                                    totalTime,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  const Text(
                                                    AppConstants.sleepHour,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: AppConstants.inter,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  Future<int> getDifference(String time1, String time2) async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());
    DateTime a = DateTime.parse('$_date $time1:00');
    DateTime b = DateTime.parse('$_date $time2:00');
    return b.difference(a).inHours;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat('HH:mm');
    return format.format(dt);
  }
}
