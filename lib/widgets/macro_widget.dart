import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
import 'package:invorecruitmenttask/models/models.dart';
import 'package:invorecruitmenttask/scenes/meals_page.dart';

import 'circular_progress_bar.dart';
import 'nutrients_widget.dart';

class MacroWidget extends StatefulWidget {
  const MacroWidget({
    Key key,
    @required this.macro
  }) : super(key: key);

  final Macro macro;

  @override
  _MacroWidgetState createState() => _MacroWidgetState();
}

class _MacroWidgetState extends State<MacroWidget> {
  double carbohydrates = 0;
  double proteins = 0;
  double fats = 0;
  int kcal = 0;

  void calculateNutrients(){
    for(Meal meal in widget.macro.meals){
      carbohydrates = carbohydrates + meal.carbohydrates;
      proteins = proteins + meal.proteins;
      fats = fats + meal.fats;
      kcal = kcal + meal.kcal;
    }

  }

  @override
  void initState(){
    calculateNutrients();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsPage(macro: widget.macro)
            )
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                      Strings.todaysMacro,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                      )
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: SizedBox()
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              SizedBox(height: 40.0),
              CircularCaloriesBar(
                  caloriesDone: kcal,
                  caloriesGoal: widget.macro.kcalGoal
              ),
              SizedBox(height: 30.0),
              NutrientsWidget(
                  carbohydrates: carbohydrates,
                  carbohydratesGoal: widget.macro.carbohydratesGoal,
                  proteins: proteins,
                  proteinsGoal: widget.macro.proteinsGoal,
                  fats: fats,
                  fatsGoal: widget.macro.fatsGoal
              )
            ],
          ),
        ),
      ),
    );
  }
}

