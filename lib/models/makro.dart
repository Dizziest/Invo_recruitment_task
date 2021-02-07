import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'meal.dart';

class Makro extends Equatable{
  final int id;
  final String date;
  final int kcalGoal;
  final double carbohydratesGoal;
  final double proteinsGoal;
  final double fatsGoal;
  final List<Meal> meals;

  Makro(this.id ,this.date, this.kcalGoal, this.proteinsGoal, this.carbohydratesGoal, this.fatsGoal, this.meals);

  factory Makro.fromJson(Map<String, dynamic> json){
    var list = json['meals'] as List;
    List<Meal> mealsList = list.map((i) => Meal.fromJson(i)).toList();

    return Makro(
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