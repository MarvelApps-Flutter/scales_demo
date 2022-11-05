import 'package:flutter/material.dart';

class DesignCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.4183333,size.height*0.3585714);
    path0.lineTo(size.width*0.4175000,size.height*0.5000000);
    path0.lineTo(size.width*0.6250000,size.height*0.5014286);
    path0.lineTo(size.width*0.6258333,size.height*0.3585714);
    path0.lineTo(size.width*0.6250000,size.height*0.3285714);
    path0.lineTo(size.width*0.5902250,size.height*0.3590429);
    path0.lineTo(size.width*0.5533000,size.height*0.3736143);
    path0.lineTo(size.width*0.5120500,size.height*0.3552429);
    path0.lineTo(size.width*0.4830667,size.height*0.3338286);
    path0.lineTo(size.width*0.4506417,size.height*0.3314286);
    path0.lineTo(size.width*0.4183333,size.height*0.3585714);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
