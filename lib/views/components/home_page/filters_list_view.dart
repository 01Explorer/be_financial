import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';

class FiltersListView extends StatelessWidget {
  const FiltersListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Chip(
              label: Text('Filters'),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Palette.whiteDetails,
                fontWeight: FontWeight.w600,
              ),
              elevation: 6,
              backgroundColor: Palette.darkBlue,
              avatar: Icon(
                Icons.textsms_sharp,
                color: Palette.whiteDetails,
              ),
              labelPadding: EdgeInsets.all(8),
            ),
          );
        },
      ),
    );
  }
}
