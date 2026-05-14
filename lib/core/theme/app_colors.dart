import 'package:flutter/material.dart';

class AppColors {

  static const Color primary =   Color(0xff9B4FDC);
  static const Color appMode =   Color(0xff070B14);

  static const Color secondary = Color(0xffAE31B1);

  static const Color background = Color(0xFFF5F5F5);

  static const Color textPrimary = Color(0xFF212121);

  static const Color textSecondary = Color(0xFF757575);

  static const Color error = Colors.red;

  static Gradient customLinearGradient() {
    return LinearGradient(
      colors: [
        Color(0xff7F00FF),
        Color(0xffE100FF),
      ],
    );
  }

}