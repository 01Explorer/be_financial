import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/theme_colors.dart';
import '../shared/spacer.dart';

class TransactionsBottom extends StatelessWidget {
  const TransactionsBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Palette.darkBlue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 18, 60, 0),
        child: Column(
          children: [
            Container(
              width: 51,
              height: 6,
              decoration: BoxDecoration(
                  color: Palette.whiteDetails,
                  borderRadius: BorderRadius.circular(3)),
            ),
            const HeightSpacer(heightSpace: 16),
            Text(
              'Click to see you transactions',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Palette.whiteDetails,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            )
          ],
        ),
      ),
    );
  }
}
