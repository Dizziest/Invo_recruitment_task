import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './widgets/linear_progress_bars.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                      'Makro na dziś',
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
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailPage())
                        );
                      }
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              _circularCaloriesBar(caloriesDone: caloriesDone, caloriesGoal: caloriesGoal),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  carbohydratesProgressBar(carbohydrates: carbohydrates, carbohydratesGoal: carbohydratesGoal),
                  proteinsProgressBar(proteins: proteins, proteinsGoal: proteinsGoal),
                  fatsProgressBar(fats: fats, fatsGoal: fatsGoal)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _circularCaloriesBar extends StatelessWidget {
  const _circularCaloriesBar({
    Key key,
    @required this.caloriesDone,
    @required this.caloriesGoal,
  }) : super(key: key);

  final int caloriesDone;
  final int caloriesGoal;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 250.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 8.0,
      percent: caloriesDone/caloriesGoal,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/calories@2x.png'),
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
                color: Color(0xff999999)
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.deepOrange,
    );
  }
}