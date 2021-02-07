import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/bloc/makro/bloc.dart';
import 'package:invorecruitmenttask/constants/app_colors.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
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
                  MakroWidget(
                    makro: makro
                  ),
                ],
              ),
            );
          }
          else if (state is MakroEmpty){
            BlocProvider.of<MakroBloc>(context).add(FetchMakroEvent());
            return Padding(
              padding: EdgeInsets.zero
            );
          }
          else {
            return Center(
              child: const Text(
                Strings.errorOccured
              ),
            );
          }
        },
      ),
    );
  }
}

class MakroWidget extends StatefulWidget {
  const MakroWidget({
    Key key,
    @required this.makro
  }) : super(key: key);

  final Makro makro;

  @override
  _MakroWidgetState createState() => _MakroWidgetState();
}

class _MakroWidgetState extends State<MakroWidget> {
  double carbohydrates = 0;
  double proteins = 0;
  double fats = 0;
  int kcal = 220;

  void calculateNutriens(){
    for(Meal meal in widget.makro.meals){
      carbohydrates = carbohydrates + meal.carbohydrates;
      proteins = proteins + meal.proteins;
      fats = fats + meal.fats;
      kcal = kcal + meal.kcal;
    }

  }

  @override
  void initState(){
    calculateNutriens();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(makro: widget.makro)
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
                  const Text(Strings.makroNaDzis,
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
                  caloriesGoal: widget.makro.kcalGoal
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LinearProgressBarWithColumn(
                      current: carbohydrates,
                      goal: widget.makro.carbohydratesGoal,
                      name: Strings.weglowodany,
                      image: 'assets/images/starch.png',
                      progressColor: AppColors.carbohydratesProgressColor
                  ),
                  LinearProgressBarWithColumn(
                      current: proteins,
                      goal: widget.makro.proteinsGoal,
                      name: Strings.bialko,
                      image: 'assets/images/fish-2.png',
                      progressColor: AppColors.proteinsProgressColor
                  ),
                  LinearProgressBarWithColumn(
                      current: fats,
                      goal: widget.makro.fatsGoal,
                      name: Strings.tluszcze,
                      image: 'assets/images/drop.png',
                      progressColor: AppColors.fatsProgressColor
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

