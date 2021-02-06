import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/bloc/makro/bloc.dart';
import 'package:invorecruitmenttask/models/models.dart';
import '../widgets/linear_progress_bar_with_column.dart';
import '../widgets/circular_progress_bar.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MakroBloc, MakroState>(
        listener: (context, MakroState state){
          if (state is MakroLoaded){
            print('Loaded');
          }
        },
        builder: (context, MakroState state){
          if (state is MakroLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is MakroLoaded) {
            final makro = state.makro;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  displayMakro(
                    makro: makro,
                  ),
                ],
              ),
            );
          }
          else if (state is MakroEmpty){
            BlocProvider.of<MakroBloc>(context).add(FetchMakroEvent(id: 1, date: '06.02.2021'));
            return Padding(
              padding: EdgeInsets.zero,
            );
          }
          else {
            return Center(
              child: Text(
                'ERROR OCCURED'
              ),
            );
          }
        },
      ),
    );
  }
}

class displayMakro extends StatefulWidget {
  const displayMakro({
    Key key,
    @required this.makro
  }) : super(key: key);

  final Makro makro;

  @override
  _displayMakroState createState() => _displayMakroState();
}

class _displayMakroState extends State<displayMakro> {
  double carbohydrates = 0;
  double proteins = 0;
  double fats = 0;
  double kcal = 0;

  List<double> calculateNutriens(){
    for(Meal meal in widget.makro.meals){
      carbohydrates = carbohydrates + meal.carbohydrates;
      proteins = proteins + meal.proteins;
      fats = fats + meal.fats;
      kcal = kcal + meal.kcal;
    }
  }


  @override
  void initState() {
    calculateNutriens();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(makro: widget.makro,)
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
              circularCaloriesBar(
                  caloriesDone: widget.makro.meals[0].kcal,
                  caloriesGoal: widget.makro.kcalGoal
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  linearProgressBarWithColumn(
                      current: carbohydrates,
                      goal: widget.makro.carbohydratesGoal,
                      name: 'Węglowodany',
                      image: 'assets/images/starch.png',
                      progressColor: 0xff48b2a1
                  ),
                  linearProgressBarWithColumn(
                      current: proteins,
                      goal: widget.makro.proteinsGoal,
                      name: 'Białko',
                      image: 'assets/images/fish-2.png',
                      progressColor: 0xff609eee
                  ),
                  linearProgressBarWithColumn(
                      current: fats,
                      goal: widget.makro.fatsGoal,
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
    );
  }
}

