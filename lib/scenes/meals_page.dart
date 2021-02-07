import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
import 'package:invorecruitmenttask/models/models.dart';
import 'package:invorecruitmenttask/widgets/meal_widget.dart';

class MealsPage extends StatefulWidget {
  MealsPage({Key key, this.title, this.macro}) : super(key: key);

  final Macro macro;
  final String title;

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {

  int index = 0;

  void incrementIndex(){
    int lenght = widget.macro.meals.length;
    if(index < lenght){
      index++;
    } else {
      print("No more meals");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Column(
                  children: [
                    MealWidget(
                      meal: widget.macro.meals[index],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          incrementIndex();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              Strings.nextMeal,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: AppColors.nextMealButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0))
                      ),
                    )
                  ]
                ),
              ),
            ),
          ),
    );
  }

}

