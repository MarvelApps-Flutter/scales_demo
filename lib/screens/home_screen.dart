import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:scaler_app/constants/app_constants.dart';
import 'package:scaler_app/screens/select_age_screen.dart';
import 'package:scaler_app/screens/sleep_hours_screen.dart';
import '../constants/color_constants.dart';
import '../widgets/shadow_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              ClipShadowPath(
                  clipper: CircularClipper(),
                  shadow: const Shadow(blurRadius: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 380,
                    color: ColorConstants.pinkColor,
                    child: Column(
                      children: [
                        SizedBox(
                            height:
                                MediaQuery.of(context).viewPadding.top + 25),
                        const Text(
                          AppConstants.selectCal,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppConstants.inter,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwipeButton.expand(
                  thumb: const Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.white,
                  ),
                  activeThumbColor: ColorConstants.pinkColor,
                  activeTrackColor: Colors.grey.shade300,
                  onSwipe: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectAgeScreen()));
                  },
                  child: Text(
                   AppConstants.bmiCal,
                    style: TextStyle(
                      color: ColorConstants.pinkColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwipeButton.expand(
                  thumb: const Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.white,
                  ),
                  activeThumbColor: ColorConstants.pinkColor,
                  activeTrackColor: Colors.grey.shade300,
                  onSwipe: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SleepHoursScreen()));
                  },
                  child:Text(
                    AppConstants.sleepHours,
                    style: TextStyle(
                      color: ColorConstants.pinkColor,
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
