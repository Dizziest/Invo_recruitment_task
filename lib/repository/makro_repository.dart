import 'package:flutter/cupertino.dart';
import 'package:invorecruitmenttask/models/models.dart';
import 'package:invorecruitmenttask/repository/repository.dart';

class MakroRepository{
  final FakeApiClient fakeApiClient;

  MakroRepository({@required this.fakeApiClient}) : assert(fakeApiClient != null);

  Future<Macro> getMakro(){
    return fakeApiClient.getMakro();
  }
}