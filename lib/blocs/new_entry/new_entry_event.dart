part of 'new_entry_bloc.dart';

abstract class NewEntryEvent extends Equatable {
  const NewEntryEvent();

  @override
  List<Object> get props => [];
}

class SetIncomeOrExpense extends NewEntryEvent {
  @override
  List<Object> get props => [];
}
