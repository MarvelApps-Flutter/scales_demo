import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';
import '../widgets/flutter_scaler.dart';
import '../widgets/wave_painter.dart';
import 'select_weight_screen.dart';

class SelectHeightScreen extends StatefulWidget {
  final int? age;
  const SelectHeightScreen({Key? key, this.age}) : super(key: key);
  @override
  State<SelectHeightScreen> createState() => _SelectHeightScreenState();
}

class _SelectHeightScreenState extends State<SelectHeightScreen> {
  final ScalePickerController _scalePickerController = ScalePickerController();
  double scaleValue = 0;
  double verticalScaleValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.pinkColor,
      appBar: buildAppBar(),
      body: buildBody());
  }

  AppBar buildAppBar() {
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
        AppConstants.selectHeight,
        style: TextStyle(
          color: Colors.black,
          fontFamily: AppConstants.inter,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      actions: [Image.asset(AppConstants.bmiImage)],
    );
  }

  Widget buildBody()
  {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                ScalePicker(
                    backgroundColor:
                        Colors.yellowAccent[200]!.withOpacity(0.5),
                    isAxisVertical: true,
                    width: 120,
                    height: MediaQuery.of(context).size.height - 300,
                    //- 300,
                    isInvertedScale: false,
                    bigTickColor: Colors.greenAccent,
                    initialValue: 33,
                    onValueChange: (value) {
                      setState(() => scaleValue = value.toDouble());
                    },
                    scalePickerController: _scalePickerController),
                Image.asset(
                 AppConstants.humanImage,
                  width: 150,
                  height: 450,
                  color: ColorConstants.pinkColor,
                )
              ],
            ),
            Align(
              child: CustomPaint(
                  painter: const WavePainter(),
                  child: SizedBox(
                    height: 230,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (scaleValue > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeightScreenDemo(
                                            height: scaleValue,
                                            selectedAge: widget.age,
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
        ),
      );
  }
}
