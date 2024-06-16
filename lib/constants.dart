import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(164, 114, 61, 1.0);
const kSecondaryColor = Colors.white;
const kTextFormFieldColor = Color.fromRGBO(245, 245, 245, 1.0);
const kContentColorLightTheme = Color.fromRGBO(29, 29, 53, 1);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kSuccessColor = Color.fromRGBO(80, 163, 135, 1.0);
const kWarninngColor = Color.fromRGBO(250, 255, 19, 1.0);
const kErrorColor = Color.fromRGBO(231, 13, 13, 1.0);

const kDefaultPadding = 16.0;

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  padding: const EdgeInsets.symmetric(vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kSecondaryColor,
  padding: const EdgeInsets.symmetric(vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(
      width: 3,
      color: kPrimaryColor,
    ),
  ),
);

class CustomClipperHomeCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.lineTo(0, h / 1.2 - 20);
    path.quadraticBezierTo(20, h / 1.2, 80, h / 1.2);
    // path.lineTo(w, h / 1.2);
    path.lineTo(w - 80, h / 1.2);
    path.quadraticBezierTo(w - 20, h - 40, w, h);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HomeCardBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(196, 160, 120, 1.0)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double w = size.width;
    double h = size.height;

    path.moveTo(0, h / 1.2 - 20); // Start the path slightly lower
    path.quadraticBezierTo(20, h / 1.2, 70, h / 1.2); // Smooth first curve
    path.lineTo(
        w - 70, h / 1.2); // Adjust straight line to make curve less pronounced
    path.quadraticBezierTo(w - 20, h - 40, w, h); // Smooth second curve
    path.lineTo(w, 0); // Close the path to the top right corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 80);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height - 160, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
