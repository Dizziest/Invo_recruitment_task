import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/strings.dart';
import 'linear_progress_bar_with_column.dart';

class NutrientsWidget extends StatelessWidget {
  const NutrientsWidget({
    Key key,
    @required this.carbohydrates,
    @required this.carbohydratesGoal,
    @required this.proteins,
    @required this.proteinsGoal,
    @required this.fats,
    @required this.fatsGoal,
  }) : super(key: key);

  final double carbohydrates;
  final double carbohydratesGoal;
  final double proteins;
  final double proteinsGoal;
  final double fats;
  final double fatsGoal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LinearProgressBarWithColumn(
            current: carbohydrates,
            goal: carbohydratesGoal,
            name: Strings.carbohydrates,
            image: 'assets/images/starch.png',
            progressColor: AppColors.carbohydratesProgressColor
        ),
        LinearProgressBarWithColumn(
            current: proteins,
            goal: proteinsGoal,
            name: Strings.proteins,
            image: 'assets/images/fish-2.png',
            progressColor: AppColors.proteinsProgressColor
        ),
        LinearProgressBarWithColumn(
            current: fats,
            goal: fatsGoal,
            name: Strings.fats,
            image: 'assets/images/drop.png',
            progressColor: AppColors.fatsProgressColor
        ),
      ],
    );
  }
}