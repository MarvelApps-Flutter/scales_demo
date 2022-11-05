import 'package:flutter/material.dart';
import 'package:scaler_app/constants/app_constants.dart';
import 'package:scaler_app/widgets/wave_painter.dart';
import '../constants/color_constants.dart';
import 'select_height_screen.dart';

class SelectAgeScreen extends StatefulWidget {
  const SelectAgeScreen({Key? key}) : super(key: key);

  @override
  State<SelectAgeScreen> createState() => _SelectAgeScreenState();
}

class _SelectAgeScreenState extends State<SelectAgeScreen> {
  int selectedAge = 0;
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
        AppConstants.selectAge,
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

  Widget buildBody() {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 100,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedAge = index + 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: selectedAge != 0 && selectedAge == index + 1
                        ? const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white)
                        : const BoxDecoration(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        color: selectedAge != 0 && selectedAge == index + 1
                            ? ColorConstants.pinkColor
                            : Colors.white,
                        fontFamily: AppConstants.inter,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }),
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
                      if (selectedAge > 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectHeightScreen(
                                      age: selectedAge,
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
      ],
    );
  }
}
