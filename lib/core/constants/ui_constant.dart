import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UIConstant {
  /// Heights and widths
  static double appWidth = Get.width;
  static double appHeight = Get.height;
  static double circleWidth = Get.width*0.35;
  /// Border Radius
  static const Radius radiusCircular = Radius.circular(15);
  static const Radius radiusCircularTiles = Radius.circular(10);
  static const BorderRadius borderRadiusAll = BorderRadius.all(radiusCircular);
  static const BorderRadius borderRadiusAllTiles = BorderRadius.all(radiusCircularTiles);
  /// Vertical Padding
  static const EdgeInsetsGeometry verticalPadding = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsetsGeometry verticalPadding5 = EdgeInsets.symmetric(vertical: 5);
  /// Horizontal Padding
  static const EdgeInsetsGeometry horizontalPadding = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsetsGeometry horizontalPaddingTiles = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsetsGeometry horizontalInsidePaddingTiles = EdgeInsets.symmetric(horizontal: 15);
  }
