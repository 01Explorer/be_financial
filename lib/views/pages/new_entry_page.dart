import 'package:be_financial/models/transaction_model.dart';
import 'package:be_financial/models/transaction_type_model.dart';
import 'package:be_financial/utils/utils.dart';
import 'package:be_financial/views/components/shared/full_width_button.dart';
import 'package:be_financial/views/components/shared/spacer.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/new_entry/new_entry_bloc.dart';
import '../themes/theme_colors.dart';

class NewEntryPage extends StatelessWidget {
  NewEntryPage({Key? key}) : super(key: key);
  final GlobalKey formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController toFromController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final List<TransactionType> listOfTypes = TransactionType.base();
  @override
  Widget build(BuildContext context) {
    TransactionType? chosenType;
    DateTime? chosenDate;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Form(
            key: formKey,
            child: BlocBuilder<NewEntryBloc, NewEntryState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExpenseOrIncomeSelector(
                          title: 'Income',
                          onTapFunction: () => context
                              .read<NewEntryBloc>()
                              .add(SetIncomeOrExpense()),
                          filledColor: (state as NewEntryInitial).isIncome
                              ? const Color.fromRGBO(65, 49, 156, 1)
                              : Palette.whiteDetails,
                        ),
                        ExpenseOrIncomeSelector(
                          title: 'Expense',
                          onTapFunction: () => context
                              .read<NewEntryBloc>()
                              .add(SetIncomeOrExpense()),
                          filledColor: !state.isIncome
                              ? const Color.fromRGBO(65, 49, 156, 1)
                              : Palette.whiteDetails,
                        )
                      ],
                    ),
                    const HeightSpacer(heightSpace: 16),
                    CustomTextFormField(
                      controller: titleController,
                      labelText: 'Title',
                      validateFunction: (value) {
                        if (value != null) {
                          if (value.length < 3) {
                            return 'Your title is too small';
                          }
                          return null;
                        }
                        return 'Please specify a Title';
                      },
                    ),
                    const HeightSpacer(heightSpace: 16),
                    CustomTextFormField(
                      controller: amountController,
                      labelText: 'Amount',
                      keyboardType: TextInputType.number,
                      formatters: [
                        CurrencyTextInputFormatter(
                            locale: 'pt_br', symbol: 'R\$ ')
                      ],
                      validateFunction: (value) {
                        if (value != null) {
                          return null;
                        }
                        return 'Please insert an Amount';
                      },
                    ),
                    const HeightSpacer(heightSpace: 16),
                    CustomTextFormField(
                      controller: descriptionController,
                      labelText: 'Description',
                    ),
                    const HeightSpacer(heightSpace: 16),
                    CustomTextFormField(
                      controller: toFromController,
                      labelText: state.isIncome ? 'From' : 'To',
                    ),
                    const HeightSpacer(heightSpace: 16),
                    CustomTextFormField(
                      controller: dateController,
                      labelText: 'Date',
                      keyboardType: TextInputType.none,
                      onTapEvent: () => showDialog(
                        context: context,
                        builder: (context) => DatePickerDialog(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2024)),
                      ).then((value) {
                        chosenDate = value;
                        return dateController.text = Utils().formatDate(value);
                      }),
                    ),
                    const HeightSpacer(heightSpace: 16),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Type',
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Palette.darkBlue,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Palette.darkBlue),
                            borderRadius: BorderRadius.circular(30)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(30)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Palette.darkBlue, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      items: listOfTypes
                          .map<DropdownMenuItem<TransactionType>>((e) {
                        return DropdownMenuItem<TransactionType>(
                            value: e,
                            child: Row(
                              children: [
                                Icon(e.desiredIcon),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(e.type)
                              ],
                            ));
                      }).toList(),
                      onChanged: (value) {
                        chosenType = value;
                      },
                    ),
                    const HeightSpacer(heightSpace: 16),
                    FullWidthButton(
                        title: 'Add',
                        onTapFunction: () {
                          print('sal');
                          context.read<HomeBloc>().add(AddTransaction(
                              Transaction(toFromController.text,
                                  title: titleController.text,
                                  transactionInOrOut: state.isIncome
                                      ? InOrOut.received
                                      : InOrOut.transferred,
                                  amount: double.tryParse(amountController.text
                                          .replaceAll('R\$', '')) ??
                                      0,
                                  date: chosenDate!,
                                  transactionType: chosenType!)));
                        })
                  ],
                );
              },
            )),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validateFunction,
    this.keyboardType,
    this.formatters,
    this.onTapEvent,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validateFunction;
  final TextInputType? keyboardType;
  final VoidCallback? onTapEvent;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validateFunction,
      onTap: onTapEvent,
      inputFormatters: formatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Palette.darkBlue,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.darkBlue),
            borderRadius: BorderRadius.circular(30)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.darkBlue, width: 2),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class ExpenseOrIncomeSelector extends StatelessWidget {
  const ExpenseOrIncomeSelector({
    Key? key,
    required this.title,
    required this.onTapFunction,
    required this.filledColor,
  }) : super(key: key);

  final String title;
  final VoidCallback onTapFunction;
  final Color filledColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapFunction,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: filledColor),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: filledColor == Palette.whiteDetails
                      ? Palette.darkBlue
                      : Palette.whiteDetails),
            ),
          ),
        ));
  }
}
