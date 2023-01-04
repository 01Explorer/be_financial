import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_entry_event.dart';
part 'new_entry_state.dart';

class NewEntryBloc extends Bloc<NewEntryEvent, NewEntryState> {
  NewEntryBloc() : super(const NewEntryInitial()) {
    on<SetIncomeOrExpense>((event, emit) {
      if (state is NewEntryInitial) {
        emit(
          const NewEntryInitial()
              .copyWith(isIncome: !(state as NewEntryInitial).isIncome),
        );
      }
    });
  }
}
