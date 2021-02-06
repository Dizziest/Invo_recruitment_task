import 'package:flutter/material.dart';
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

  double carbohydrates = 0;
  double proteins = 0;
  double fats = 0;

  List<double> calculateNutriens(){
    for(Meal meal in widget.makro.meals){
      carbohydrates = carbohydrates + meal.carbohydrates;
      proteins = proteins + meal.proteins;
      fats = fats + meal.proteins;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: displayMeal(
          meal: widget.makro.meals[0],
        ),
    );
  }

  @override
  void initState() {
    calculateNutriens();
  }
}

class displayMeal extends StatelessWidget {
  const displayMeal({
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
                    Text(
                      'Składniki Makro',
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
                      border: Border.all(color: Color(0xfff3f3f3), width: 1.0),
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
                    linearProgressBarWithColumn(
                        current: meal.carbohydrates,
                        goal: meal.carbohydratesGoal,
                        name: 'Węglowodany',
                        image: 'assets/images/starch.png',
                        progressColor: 0xff48b2a1
                    ),
                    linearProgressBarWithColumn(
                        current: meal.proteins,
                        goal: meal.proteinsGoal,
                        name: 'Białko',
                        image: 'assets/images/fish-2.png',
                        progressColor: 0xff609eee
                    ),
                    linearProgressBarWithColumn(
                        current: meal.fats,
                        goal: meal.fatsGoal,
                        name: 'Tłuszcze',
                        image: 'assets/images/drop.png',
                        progressColor: 0xfff6bf27
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Alergeny',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                alergensList(alergenList: meal.alergens),
                SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Kolejny posiłek',
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
                      primary: Color(0xfff94f36),
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

