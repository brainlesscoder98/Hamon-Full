import 'package:flutter/material.dart';

import '../../../core/constants/ui_colors.dart';
import '../../../core/views/molecules/custom_space.dart';
import '../molecules/molecules.dart';

class ConferenceSeating extends StatelessWidget {
  final int totalSeats;
  const ConferenceSeating({
    required this.totalSeats,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (totalSeats % 2 != 0) // If odd number of seats
            const CustomSpace(width: 10) ,// Adjust space for odd seats alignment
            buildSeats(totalSeats ~/ 2 + totalSeats % 2,totalSeats,"assets/png/right.png"),
            const CustomSpace(width: 10),
            Container(
              width: 150.0,
              height: (totalSeats / 2 * 40) + 20,
              color: UIColors.grey217, // Central table
            ),
            const CustomSpace(width: 16),
            buildSeats(totalSeats ~/ 2,totalSeats,"assets/png/left.png"),
          ],
        ),
      ),
    );
  }
}
