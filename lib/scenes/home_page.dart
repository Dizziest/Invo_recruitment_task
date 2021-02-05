import 'package:flutter/material.dart';
import '../widgets/linear_progress_bar_with_column.dart';
import '../widgets/circular_progress_bar.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int caloriesDone = 620;
  int caloriesGoal = 2000;
  double carbohydrates = 81.1;
  double carbohydratesGoal = 200;
  double proteins = 15.0;
  double proteinsGoal = 100.0;
  double fats = 38.8;
  double fatsGoal = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage()
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
                          Text('Makro na dziś',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
                      circularCaloriesBar(
                          caloriesDone: caloriesDone,
                          caloriesGoal: caloriesGoal
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          linearProgressBarWithColumn(
                              current: 81.1,
                              goal: 200,
                              name: 'Węglowodany',
                              image: 'assets/images/starch.png',
                              progressColor: 0xff48b2a1
                          ),
                          linearProgressBarWithColumn(
                              current: 15.0,
                              goal: 100,
                              name: 'Białko',
                              image: 'assets/images/fish-2.png',
                              progressColor: 0xff609eee
                          ),
                          linearProgressBarWithColumn(
                              current: 38.8,
                              goal: 50,
                              name: 'Tłuszcze',
                              image: 'assets/images/drop.png',
                              progressColor: 0xfff6bf27
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

