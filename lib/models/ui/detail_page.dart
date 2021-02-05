import 'package:flutter/material.dart';
import './widgets/linear_progress_bars.dart';

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

  final List<String> alergens = <String>[
    'Skorupiaki',
    'Orzeszki ziemne',
    'Mleko'
  ];
  final List<String> alergenImages = <String>[
    'assets/images/crab.png',
    'assets/images/peanut.png',
    'assets/images/milk.png'
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
                      fontWeight: FontWeight.w700),
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                              '400 kcal',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w700),
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
                    carbohydratesProgressBar(
                        carbohydrates: carbohydrates,
                        carbohydratesGoal: carbohydratesGoal),
                    proteinsProgressBar(
                        proteins: proteins, proteinsGoal: proteinsGoal),
                    fatsProgressBar(fats: fats, fatsGoal: fatsGoal)
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
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                _alergensList(alergens: alergens, alergenImages: alergenImages),
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
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Color(0xfff94f36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                )
              ],
            )),
          ),
        ));
  }
}

class _alergensList extends StatelessWidget {
  const _alergensList({
    Key key,
    @required this.alergens,
    @required this.alergenImages,
  }) : super(key: key);

  final List<String> alergens;
  final List<String> alergenImages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: alergens.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff3f3f3), width: 1.0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      alergens[index],
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Image.asset(alergenImages[index])
                  ],
                ),
              ),
            );
          } else if (index == alergens.length - 1) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff3f3f3), width: 1.0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      alergens[index],
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Image.asset(alergenImages[index])
                  ],
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff3f3f3), width: 1.0),
              ),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      alergens[index],
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Image.asset(alergenImages[index])
                  ],
                ),
              ),
            );
          }
        });
  }
}
