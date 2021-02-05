import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                SizedBox(width: 20.0),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage())
                    );
                  },
                  child: Image.asset('assets/images/arrow_right.png'),
                ),
                SizedBox(width: 20.0)
              ],
            ),
            SizedBox(height: 60.0),
            CircularPercentIndicator(
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
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/starch.png'),
                    SizedBox(height: 13.0),
                    Text(
                      'Węglowodany',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999999)
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      '$carbohydrates g',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    LinearPercentIndicator(
                      width: 90,
                      lineHeight: 8.0,
                      percent: carbohydrates/carbohydratesGoal,
                      progressColor: Color(0xFF48B2A1),
                    ),
                  ],

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/fish-2.png'),
                    SizedBox(height: 15.0),
                    Text(
                      'Białko',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff999999)
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      '$proteins g',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    LinearPercentIndicator(
                      width: 90.0,
                      lineHeight: 8.0,
                      percent: proteins/proteinsGoal,
                      progressColor: Color(0xFF609EEE),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/drop.png'),
                    SizedBox(height: 12.0),
                    Text(
                      'Tłuszcze',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff999999)
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      '$fats g',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    LinearPercentIndicator(
                      width: 90.0,
                      lineHeight: 8.0,
                      percent: fats/fatsGoal,
                      progressColor: Color(0xFFF6BF27),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}