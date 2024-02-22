import 'package:flutter/cupertino.dart';

class CustomSpace extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomSpace({
    this.height,
    this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 0,
      width: width??0,
    );
  }
}
