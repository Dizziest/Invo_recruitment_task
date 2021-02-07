import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
import 'package:invorecruitmenttask/models/models.dart';
import '../widgets/alergens_list.dart';
import '../widgets/linear_progress_bar_with_column.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title, this.makro}) : super(key: key);

  final Makro makro;
  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: MealWidget(
            meal: widget.makro.meals[0],
          ),
    );
  }

}

class MealWidget extends StatelessWidget {
  const MealWidget({
    Key key,
    @required this.meal
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: Column(
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
                  meal.title,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 23.0,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  meal.name,
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
                    const Text(
                      Strings.skladnikiMakro,
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
                              '${meal.kcal} kcal',
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
                        current: meal.carbohydrates,
                        goal: meal.carbohydratesGoal,
                        name: Strings.weglowodany,
                        image: 'assets/images/starch.png',
                        progressColor: AppColors.carbohydratesProgressColor
                    ),
                    LinearProgressBarWithColumn(
                        current: meal.proteins,
                        goal: meal.proteinsGoal,
                        name: Strings.bialko,
                        image: 'assets/images/fish-2.png',
                        progressColor: AppColors.proteinsProgressColor
                    ),
                    LinearProgressBarWithColumn(
                        current: meal.fats,
                        goal: meal.fatsGoal,
                        name: Strings.tluszcze,
                        image: 'assets/images/drop.png',
                        progressColor: AppColors.fatsProgressColor
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      Strings.alergeny,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                AlergensList(alergenList: meal.alergens),
                SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          Strings.kolejnyPosilek,
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
              ],
            )
        ),
      ),
    );
  }
}

