import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularCaloriesBar extends StatelessWidget {
  const CircularCaloriesBar({
    Key key,
    @required this.caloriesDone,
    @required this.caloriesGoal,
  }) : super(key: key);

  final int caloriesDone;
  final int caloriesGoal;

  double calculatePercent(int current, int goal){
    double percent = current / goal;
    if(percent > 1){
      return 1;
    } else {
      return percent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 8.0,
      percent: calculatePercent(caloriesDone, caloriesGoal),
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/calories.png'),
          SizedBox(height: 5.0),
          Text(
            "$caloriesDone kcal",
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
              fontSize: 19.0,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            "/$caloriesGoal kcal",
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: AppColors.greyText
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.deepOrange,
    );
  }
}