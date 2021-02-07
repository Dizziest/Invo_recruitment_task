import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/models/alergen.dart';

class AlergenListItem extends StatelessWidget {
  const AlergenListItem({
    Key key,
    @required this.alergen,
  }) : super(key: key);

  final Alergen alergen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: AppColors.greyBorder,
                width: 1.0
            ),
        ),
      ),
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              alergen.name,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400
              ),
            ),
            Image.asset(alergen.image)
          ],
        ),
      ),
    );
  }
}
