import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'meal.dart';

class Makro extends Equatable{
  final int id;
  final String date;
  final int kcalGoal;
  final double proteinsGoal;
  final double carbohydratesGoal;
  final double fatsGoal;

  List<Meal> meals;

  Makro(this.id ,this.date, this.kcalGoal, this.proteinsGoal, this.carbohydratesGoal, this.fatsGoal);

  @override
  List<Object> get props => [
    date,
    kcalGoal,
    meals,
    proteinsGoal,
    carbohydratesGoal,
    fatsGoal
  ];
}