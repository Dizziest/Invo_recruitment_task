import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'meal.dart';

class Macro extends Equatable{
  final int id;
  final String date;
  final int kcalGoal;
  final double carbohydratesGoal;
  final double proteinsGoal;
  final double fatsGoal;
  final List<Meal> meals;

  Macro(this.id ,this.date, this.kcalGoal, this.carbohydratesGoal, this.proteinsGoal,  this.fatsGoal, this.meals);

  factory Macro.fromJson(Map<String, dynamic> json){
    var list = json['meals'] as List;
    List<Meal> mealsList = list.map((i) => Meal.fromJson(i)).toList();

    return Macro(
        json['id'],
        json['date'],
        json['kcalGoal'],
        json['carbohydratesGoal'],
        json['proteinsGoal'],
        json['fatsGoal'],
        mealsList
    );
  }

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