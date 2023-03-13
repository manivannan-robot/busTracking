import 'package:flutter/material.dart';

class ColorConstant {
  // static Color bgColor = fromHex('#ffffff');
  static Color bgColor = fromHex('#f5f6f6');
  static Color themeColor = fromHex('#1a434e');
  static Color textWhite = fromHex('#ffffff');
  static Color textBlack = fromHex('#000000');
  static Color button = fromHex('#fbf3ea');
  static Color appBarIconColor = fromHex('#ffffff');
  static Color splashColor = fromHex('#eeeeee');
  static Color shimmerBaseColor = fromHex('#d6d6d6');
  static Color shimmerHighlightColor = fromHex('#eeeeee');
  static Color dowloadButtonColor = fromHex('#003413');
  static Color approveButtonColor = fromHex('#30A12E');
  static Color resubmitButtonColor = fromHex('#F31A1E');
  // static Color whiteBackground = Colors.white70;
  static Color color1 = fromHex('#f79e1b');
  static Color color2 = fromHex('#6c74e1');
  static Color color3 = fromHex('#598631');

  // static Color backgroundColor = Colors.green;
  // static Color textColor = Colors.black87;
  // static Color hintTextColor = Colors.grey;
  // static Color AppTextColor = Color(0xff003413);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
