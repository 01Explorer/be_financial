part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadingHomeEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ChoseDataMonths extends HomeEvent {
  final int initialMonthNumber;
  final int finalMonthNumber;

  const ChoseDataMonths(this.initialMonthNumber, this.finalMonthNumber);
  @override
  List<Object> get props => [initialMonthNumber, finalMonthNumber];
}

class ChoseFilter extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SeeMonthlyIncome extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ChangeFilteredMonthOnBottomSheet extends HomeEvent {
  final int chosenFilteredMonth;

  const ChangeFilteredMonthOnBottomSheet(this.chosenFilteredMonth);
  @override
  List<Object> get props => [chosenFilteredMonth];
}

class AddTransaction extends HomeEvent {
  final Transaction transactionToAdd;

  const AddTransaction(this.transactionToAdd);

  // @override
  // List<Object> get props => [transactionToAdd];
}
