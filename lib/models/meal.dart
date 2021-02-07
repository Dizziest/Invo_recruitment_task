import 'package:invorecruitmenttask/models/alergen.dart';

class Meal{
  final String title;
  final String name;
  final int kcal;
  final double carbohydrates;
  final double carbohydratesGoal;
  final double proteins;
  final double proteinsGoal;
  final double fats;
  final double fatsGoal;
  final List<Alergen> alergens;

  Meal(this.title, this.name, this.kcal, this.carbohydrates, this.carbohydratesGoal, this.proteins, this.proteinsGoal, this.fats, this.fatsGoal, this.alergens);

  factory Meal.fromJson(Map<String, dynamic> json){
    var list = json['alergens'] as List;
    List<Alergen> alergenList = list.map((i) => Alergen.fromJson(i)).toList();

    return Meal(
        json['title'],
        json['name'],
        json['kcal'],
        json['carbohydrates'],
        json['carbohydratesGoal'],
        json['proteins'],
        json['proteinsGoal'],
        json['fats'],
        json['fatsGoal'],
        alergenList
    );
  }

}