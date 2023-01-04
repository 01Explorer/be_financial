// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  final User user;
  final int chosenStartMonthNumber;
  final int chosenEndMonthNumber;
  final bool viewMonthlyIncome;
  final int selectedMonthFilter;
  final List<Transaction> usersTransactions;

  const HomeInitial(
    this.user,
    this.chosenStartMonthNumber,
    this.chosenEndMonthNumber, {
    this.viewMonthlyIncome = false,
    this.selectedMonthFilter = 0,
    required this.usersTransactions,
  });

  HomeInitial copyWith(
      {User? user,
      int? chosenStartMonthNumber,
      int? chosenEndMonthNumber,
      bool? viewMonthlyIncome,
      int? selectedMonthFilter,
      List<Transaction>? usersTransactions}) {
    return HomeInitial(
        user ?? this.user,
        chosenStartMonthNumber ?? this.chosenStartMonthNumber,
        chosenEndMonthNumber ?? this.chosenEndMonthNumber,
        viewMonthlyIncome: viewMonthlyIncome ?? this.viewMonthlyIncome,
        selectedMonthFilter: selectedMonthFilter ?? this.selectedMonthFilter,
        usersTransactions: usersTransactions ?? this.usersTransactions);
  }

  @override
  List<Object> get props => [
        user,
        chosenStartMonthNumber,
        chosenEndMonthNumber,
        viewMonthlyIncome,
        selectedMonthFilter,
        usersTransactions
      ];
}
