import 'package:be_financial/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/home/home_bloc.dart';
import '../../../themes/theme_colors.dart';
import '../../shared/spacer.dart';
import '../chart/chart.dart';
import '../chart_title_row.dart';
import '../custom_modal_bottom_sheet.dart';
import '../filters_list_view.dart';
import '../header/header_section.dart';
import '../transactions_bottom.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.selectedMonth,
    required this.user,
  }) : super(key: key);

  final int selectedMonth;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 29, 24, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    HeaderSection(user: user),
                    const HeightSpacer(heightSpace: 60),
                    const ChartTitleRow(),
                    const HeightSpacer(heightSpace: 40),
                    const BarChartSample3(),
                    const HeightSpacer(heightSpace: 24),
                    const Text(
                      'R\$ 2.400,00',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    const Text(
                      'Monthly Average Expenses',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Palette.darkBlue),
                    ),
                    const HeightSpacer(heightSpace: 8),
                  ],
                ),
              ),
            ),
            const FiltersListView(),
            const HeightSpacer(heightSpace: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Palette.darkBlue,
                  context: context,
                  builder: (context) {
                    return const CustomModalBottomSheet();
                  },
                ),
                child: const TransactionsBottom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
