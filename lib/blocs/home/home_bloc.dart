import 'package:be_financial/models/transaction_model.dart';
import 'package:be_financial/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<LoadingHomeEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(HomeInitial(
          User(
              name: 'Gabriel',
              email: 'gabriel@gmail.com',
              monthlyIncome: 2500,
              yearlyIncome: 2500 * 12),
          1,
          7,
          usersTransactions: const []));
    });

    on<ChoseDataMonths>((event, emit) {
      if (state is HomeInitial) {
        emit((state as HomeInitial).copyWith(
            chosenStartMonthNumber: event.initialMonthNumber,
            chosenEndMonthNumber: event.finalMonthNumber));
      }
    });

    on<SeeMonthlyIncome>((event, emit) {
      if (state is HomeInitial) {
        emit((state as HomeInitial).copyWith(
            viewMonthlyIncome: !(state as HomeInitial).viewMonthlyIncome));
      }
    });

    on<ChangeFilteredMonthOnBottomSheet>((event, emit) {
      if (state is HomeInitial) {
        emit((state as HomeInitial)
            .copyWith(selectedMonthFilter: event.chosenFilteredMonth));
      }
    });

    on<AddTransaction>((event, emit) {
      if (state is HomeInitial) {
        List<Transaction> listOfTransactions =
            (state as HomeInitial).usersTransactions;
        listOfTransactions.add(event.transactionToAdd);
        emit((state as HomeInitial)
            .copyWith(usersTransactions: listOfTransactions));
      }
    });
  }
}
