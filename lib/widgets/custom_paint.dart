import 'package:flutter/material.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.blue;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height*0.6634500);
    path0.quadraticBezierTo(size.width*0.0706400,size.height*0.6920000,size.width*0.1703733,size.height*0.7082250);
    path0.cubicTo(size.width*0.2836267,size.height*0.7224750,size.width*0.4093867,size.height*0.7320750,size.width*0.5222400,size.height*0.7237500);
    path0.cubicTo(size.width*0.6110133,size.height*0.7151000,size.width*0.7201600,size.height*0.7041500,size.width*0.8516533,size.height*0.6586750);
    path0.quadraticBezierTo(size.width*0.9476267,size.height*0.6212000,size.width,size.height*0.5769250);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}