import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Path> {

  List<Offset> _extractPoints(String clipPath, Size size) {
    final points = List<Offset>.empty(growable: true);
//clipPath is the string we get from our path generator
    var tempString = clipPath.replaceAll("%", "");
    tempString = tempString.replaceAll(", ", ",");

    final pointStrings = tempString.split(",");

    for (final pointString in pointStrings) {
      final coord = pointString.split(" ");

      if (coord.length == 2) {
        points.add(
          Offset(
            (double.parse(coord[0]) * size.width / 100),
            (double.parse(coord[1]) * size.height / 100),
          ),
        );
      }
    }

    return points;
  }

//Through this function we get a list of coordinates .

//Then we use getclip function which return the path made by these coordinates
  @override
  Path getClip(Size size) {
    final path = Path();

    final clipPath = "0 0, 100% 0, 100% 45%, 75% 59%, 0 46%";

    final points = _extractPoints(clipPath, size);
    path.addPolygon(points, true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}


// @override
  // Path getClip(Size size) {
  //   var path = Path();
  //   path.lineTo(0.0, size.height - 50);
  //   path.quadraticBezierTo(
  //     size.width / 4,
  //     size.height,
  //     size.width / 2,
  //     size.height,
  //   );
  //   path.quadraticBezierTo(
  //     size.width - size.width / 4,
  //     size.height,
  //     size.width,
  //     size.height - 50,
  //   );
  //   path.lineTo(size.width, 0.0);
  //   path.close();
  //   return path;
  // }
  //
  // @override
  // bool shouldReclip(CustomClipper<Path> oldClipper) => false;

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow? shadow;
  final CustomClipper<Path>? clipper;
  final Widget? child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow? shadow;
  final CustomClipper<Path>? clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow!.toPaint();
    var clipPath = clipper!.getClip(size).shift(shadow!.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}