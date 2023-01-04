part of 'new_entry_bloc.dart';

abstract class NewEntryState extends Equatable {
  const NewEntryState();

  @override
  List<Object> get props => [];
}

class NewEntryInitial extends NewEntryState {
  final bool isIncome;

  const NewEntryInitial({this.isIncome = true});

  NewEntryInitial copyWith({final bool? isIncome}) {
    return NewEntryInitial(
      isIncome: isIncome ?? this.isIncome,
    );
  }

  @override
  List<Object> get props => [isIncome];
}
