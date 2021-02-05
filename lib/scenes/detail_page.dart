import 'package:flutter/material.dart';
import 'package:invorecruitmenttask/models/alergen.dart';
import '../widgets/alergens_list.dart';
import '../widgets/linear_progress_bar_with_column.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  double carbohydrates = 81.1;
  double carbohydratesGoal = 200;
  double proteins = 15.0;
  double proteinsGoal = 100.0;
  double fats = 38.8;
  double fatsGoal = 50.0;
  double kcal = 400;

  final List<Alergen> alergens = <Alergen>[
    Alergen('Skorupiaki', 'assets/images/crab.png'),
    Alergen('Orzeszki ziemne', 'assets/images/peanut.png'),
    Alergen('Mleko', 'assets/images/milk.png')
  ];

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
                      'II Śniadanie',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 23.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'ze szpinakiem, twarożkiem z suszonymi pomidorami, oliwkami i rzodkiewką',
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
                                Image.asset('assets/images/calories@2x.png'),
                                SizedBox(height: 5.0),
                                Text(
                                  '$kcal kcal',
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
                            current: carbohydrates,
                            goal: carbohydratesGoal,
                            name: 'Węglowodany',
                            image: 'assets/images/starch.png',
                            progressColor: 0xff48b2a1
                        ),
                        linearProgressBarWithColumn(
                            current: proteins,
                            goal: proteinsGoal,
                            name: 'Białko',
                            image: 'assets/images/fish-2.png',
                            progressColor: 0xff609eee
                        ),
                        linearProgressBarWithColumn(
                            current: fats,
                            goal: fatsGoal,
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
                    alergensList(alergenList: alergens),
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
        )
    );
  }
}

