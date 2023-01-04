import 'package:be_financial/blocs/home/home_bloc.dart';
import 'package:be_financial/blocs/new_entry/new_entry_bloc.dart';
import 'package:be_financial/blocs/transactions/transactions_bloc.dart';
import 'package:be_financial/views/pages/new_entry_page.dart';
import 'package:be_financial/views/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(LoadingHomeEvent()),
        ),
        BlocProvider(
          create: (context) => TransactionsBloc(),
        ),
        BlocProvider(
          create: (context) => NewEntryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().standardTheme,
        home: NewEntryPage(),
      ),
    );
  }
}
