
import 'package:flutter/material.dart';
import 'package:hamon/core/constants/ui_constant.dart';


class ClassroomSeating extends StatelessWidget {
  final int totalSeats;
  const ClassroomSeating({
    required this.totalSeats,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIConstant.horizontalInsidePaddingTiles,
      child: GridView.builder(
        itemCount: totalSeats,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child:Image.asset("assets/png/right.png",width: 15,height: 15,)
          );
        },
      ),
    );
  }
}