import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/ui_colors.dart';


TextStyle _getTextStyle(
    double? fontSize,
    Color? color,
    FontWeight? fontWeight, {
      TextStyle? textStyle,
      Color? backgroundColor,
      FontStyle? fontStyle,
      double? letterSpacing,
      double? wordSpacing,
      TextBaseline? textBaseline,
      double? height,
      Locale? locale,
      Paint? foreground,
      Paint? background,
      List<Shadow>? shadows,
      TextDecoration? decoration,
      Color? decorationColor,
      TextDecorationStyle? decorationStyle,
      double? decorationThickness,
    }) {
  return GoogleFonts.manrope(
    //fontFamily ?? 'Manrope',
    textStyle: textStyle,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  );
}

/// regular text style
TextStyle getRegularStyle({
  double fontSize = 14,
  Color color = UIColors.textNormalBlack,
  FontWeight fontWeight = FontWeight.w400,
  double? lineSpacing = 1.365,
  double? letterSpacing,
}) {
  return _getTextStyle(
    fontSize,
    color,
    fontWeight,
    height: lineSpacing,
    letterSpacing: letterSpacing,
  );
}

/// bold text style

TextStyle getBoldStyle({
  double fontSize = 14,
  Color color = UIColors.textNormalBlack,
  FontWeight fontWeight = FontWeight.w700,
  double? lineSpacing = 1.365,
}) {
  return _getTextStyle(
    fontSize,
    color,
    fontWeight,
    height: lineSpacing,
  );
}

/// semi bold text style

TextStyle getSemiBoldStyle({
  double fontSize = 14,
  Color color = UIColors.textNormalBlack,
  FontWeight fontWeight = FontWeight.w600,
  double? lineSpacing = 1.365,
}) {
  return _getTextStyle(
    fontSize,
    color,
    fontWeight,
    height: lineSpacing,
  );
}

/// medium text style

TextStyle getMediumStyle({
  double fontSize = 14,
  Color color = UIColors.textNormalBlack,
  FontWeight fontWeight = FontWeight.w500,
  double? lineSpacing = 1.365,
}) {
  return _getTextStyle(
    fontSize,
    color,
    fontWeight,
    height: lineSpacing,
  );
}

///custom or flutter default style
TextStyle getCustomStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  TextDecoration? decoration,
}) {
  return _getTextStyle(fontSize, color, fontWeight, decoration: decoration);
}
