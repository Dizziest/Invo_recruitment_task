import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
import 'package:invorecruitmenttask/models/models.dart';

import 'alergens_list.dart';
import 'linear_progress_bar_with_column.dart';

class MealWidget extends StatefulWidget {
  const MealWidget({
    Key key,
    @required this.meal
  }) : super(key: key);

  final Meal meal;

  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/images/Group.png'),
            ),
          ],
        ),
        Text(
          widget.meal.title,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 23.0,
              fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 25.0),
        Text(
          widget.meal.name,
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.macroContents,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyBorder, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/calories.png'),
                    SizedBox(height: 5.0),
                    Text(
                      '${widget.meal.kcal} kcal',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 19.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 45.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LinearProgressBarWithColumn(
                current: widget.meal.carbohydrates,
                goal: widget.meal.carbohydratesGoal,
                name: Strings.carbohydrates,
                image: 'assets/images/starch.png',
                progressColor: AppColors.carbohydratesProgressColor
            ),
            LinearProgressBarWithColumn(
                current: widget.meal.proteins,
                goal: widget.meal.proteinsGoal,
                name: Strings.proteins,
                image: 'assets/images/fish-2.png',
                progressColor: AppColors.proteinsProgressColor
            ),
            LinearProgressBarWithColumn(
                current: widget.meal.fats,
                goal: widget.meal.fatsGoal,
                name: Strings.fats,
                image: 'assets/images/drop.png',
                progressColor: AppColors.fatsProgressColor
            ),
          ],
        ),
        SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.alergens,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        AlergensList(alergenList: widget.meal.alergens),
        SizedBox(height: 40.0),
      ],
    );
  }
}