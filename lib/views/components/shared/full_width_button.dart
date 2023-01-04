import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/theme_colors.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    Key? key,
    required this.title,
    required this.onTapFunction,
  }) : super(key: key);

  final String title;
  final VoidCallback onTapFunction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(65, 49, 156, 1)),
          onPressed: onTapFunction,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Palette.whiteDetails),
          )),
    );
  }
}
