import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  final double heightSpace;
  const HeightSpacer({Key? key, required this.heightSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSpace,
    );
  }
}
