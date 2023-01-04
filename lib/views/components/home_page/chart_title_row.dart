import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';

class ChartTitleRow extends StatelessWidget {
  const ChartTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Projects Income',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          height: 26,
          width: 103,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.5))),
          child: const Center(
            child: Text(
              '(Jan - July)',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Palette.darkBlue),
            ),
          ),
        )
      ],
    );
  }
}
