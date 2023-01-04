import 'package:be_financial/utils/utils.dart';
import 'package:be_financial/views/components/shared/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/home/home_bloc.dart';
import '../../../../models/user_model.dart';
import '../../../themes/theme_colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, ${user.name}!',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const HeightSpacer(heightSpace: 8),
                    GestureDetector(
                      onTap: () =>
                          context.read<HomeBloc>().add(SeeMonthlyIncome()),
                      child: Text(
                        Utils().formatCurrencyBRL(
                            (state as HomeInitial).viewMonthlyIncome
                                ? user.monthlyIncome!
                                : user.yearlyIncome!),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Palette.darkBlue),
                      ),
                    ),
                    const HeightSpacer(heightSpace: 8),
                    Text.rich(
                      TextSpan(
                          text: DateTime.now().year.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          children: [
                            TextSpan(
                                text: state.viewMonthlyIncome
                                    ? ' Monthly Income'
                                    : ' Yearly Income',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14))
                          ]),
                    ),
                  ],
                );
              },
            ),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/images/standardAvatar.png'),
            )
          ],
        ),
      ],
    );
  }
}
