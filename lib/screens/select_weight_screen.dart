import 'package:flutter/material.dart';
import 'package:scaler_app/constants/app_constants.dart';
import '../constants/color_constants.dart';
import '../widgets/wave_painter.dart';
import 'calculate_bmi_screen.dart';

class WeightScreenDemo extends StatefulWidget {
  final double? height;
  final int? selectedAge;
  const WeightScreenDemo({Key? key, this.height, this.selectedAge})
      : super(key: key);

  @override
  State<WeightScreenDemo> createState() => _WeightScreenDemoState();
}

class _WeightScreenDemoState extends State<WeightScreenDemo> {
  double value = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.pinkColor,
      appBar: buildAppBar(),
      body: buildBody());
  }

  AppBar buildAppBar()
  {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          AppConstants.selectWeight,
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppConstants.inter,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
         actions: [
          Image.asset(AppConstants.bmiImage)
        ],
      );
  }

  Widget buildBody()
  {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.amber,
            inactiveColor: Colors.amber.shade200,
            thumbColor: Colors.amberAccent,
            value: value,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
          ),
          Text(
            "Selected weight is ${value.toStringAsFixed(0)}",
            style: const TextStyle(
              color: Colors.black,
              fontFamily: AppConstants.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Align(
            child: CustomPaint(
                painter: const WavePainter(),
                child: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (value > 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalculateBMIScreen(
                                          height: widget.height,
                                          weight: value,
                                          selectedAge: widget.selectedAge,
                                        )));
                          }
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
                              Text(
                                AppConstants.next,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstants.pinkColor,
                                  fontFamily: AppConstants.inter,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: ColorConstants.pinkColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                               AppConstants.bmiDefinition,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppConstants.inter,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                             AppConstants.bmiWarning,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppConstants.inter,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      );
  }
}
