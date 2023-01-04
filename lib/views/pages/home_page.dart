import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/home/home_bloc.dart';
import '../components/home_page/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is HomeInitial) {
          return HomeView(
            selectedMonth: state.chosenStartMonthNumber,
            user: state.user,
          );
        }
        return Container(
          color: Colors.red,
          height: 200,
          width: 200,
        );
      },
    );
  }
}
