import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/home/home_bloc.dart';
import '../../themes/theme_colors.dart';
import '../shared/full_width_button.dart';
import '../shared/spacer.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          Container(
            width: 51,
            height: 6,
            decoration: BoxDecoration(
                color: Palette.whiteDetails,
                borderRadius: BorderRadius.circular(3)),
          ),
          const HeightSpacer(heightSpace: 8),
          Text(
            'Drag down to return',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.whiteDetails,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          const HeightSpacer(heightSpace: 40),
          Text(
            'Transactions',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Palette.whiteDetails,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          SizedBox(
            height: 90,
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Palette.whiteDetails,
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => context
                                .read<HomeBloc>()
                                .add(ChangeFilteredMonthOnBottomSheet(index)),
                            child: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                height: 32,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: (state as HomeInitial)
                                                .selectedMonthFilter ==
                                            index
                                        ? const Color.fromRGBO(65, 49, 156, 1)
                                        : Palette.darkBlue),
                                child: Center(
                                  child: Text(
                                    'Mês',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: Palette.whiteDetails,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Palette.whiteDetails,
                ),
              ],
            ),
          ),
          const HeightSpacer(heightSpace: 40),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(65, 49, 156, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Palette.yellow),
                      child: const Icon(
                        Icons.food_bank_rounded,
                        color: Palette.whiteDetails,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Food',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Palette.whiteDetails),
                        ),
                        Text('Spent in Food in Mês',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Palette.whiteDetails)),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('R\$ 2.500,00',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Palette.yellow)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          FullWidthButton(title: 'All Entries', onTapFunction: () {}),
          FullWidthButton(title: 'Add Entry', onTapFunction: () {})
        ],
      ),
    );
  }
}
