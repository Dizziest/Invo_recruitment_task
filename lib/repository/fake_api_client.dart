import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:invorecruitmenttask/models/models.dart';

class FakeApiClient{

  Future<String> _loadJSONFromAssets() async {
    return await rootBundle.loadString('assets/MacroJSON.json');
  }

  Future<Makro> getMakro() async {
    String jsonString = await _loadJSONFromAssets();
    final makroJson = jsonDecode(jsonString);
    return Makro.fromJson(makroJson);
  }

}