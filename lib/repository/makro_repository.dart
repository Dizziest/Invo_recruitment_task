import 'package:flutter/cupertino.dart';
import 'package:invorecruitmenttask/models/models.dart';
import 'package:invorecruitmenttask/repository/repository.dart';

class MakroRepository{
  final FakeApiClient fakeApiClient;

  MakroRepository({@required this.fakeApiClient}) : assert(fakeApiClient != null);

  Makro getMakro(int userId, String date){
    return fakeApiClient.getMakro(userId, date);
  }

  List<Meal> getMeals(int makroId){
    return fakeApiClient.getMeals(makroId);
  }
}