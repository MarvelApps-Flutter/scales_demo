import 'package:flutter/material.dart';
import 'package:scaler_app/constants/app_constants.dart';
import 'package:scaler_app/constants/color_constants.dart';
import '../widgets/wave_painter.dart';
import 'home_screen.dart';

class CalculateBMIScreen extends StatefulWidget {
  final double? height;
  final double? weight;
  final int? selectedAge;
  const CalculateBMIScreen(
      {Key? key, this.height, this.weight, this.selectedAge})
      : super(key: key);

  @override
  State<CalculateBMIScreen> createState() => _CalculateBMIScreenState();
}

class _CalculateBMIScreenState extends State<CalculateBMIScreen> {
  String? bmi;
  double? result;
  String? bmiDescription;
  @override
  void initState() {
    super.initState();
    bmi = ((widget.weight!) / (widget.height! * widget.height!) * 10000)
        .toStringAsFixed(1);
    result = double.parse(bmi!);
    if (result! >= 25.0 && result! < 29.9) {
      bmiDescription = AppConstants.overweight;
    } else if (result! >= 18.5 && result! < 25.0) {
      bmiDescription = AppConstants.normal;
    } else if (result! >= 29.9) {
      bmiDescription = AppConstants.obese;
    } else {
      bmiDescription = AppConstants.underWeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.pinkColor,
      appBar: AppBar(
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
          AppConstants.bmiResult,
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppConstants.inter,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [Image.asset(AppConstants.bmiImage)],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            "BMI is $bmi",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: AppConstants.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You have $bmiDescription body weight",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: AppConstants.inter,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.selectedAge.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                           AppConstants.manAge,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w400,
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
                            widget.height!.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            AppConstants.height,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w400,
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
                            widget.weight!.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            AppConstants.weight,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppConstants.inter,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
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
                          children:[
                            Icon(
                              Icons.refresh,
                              size: 40,
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
        ],
      ),
    );
  }
}
