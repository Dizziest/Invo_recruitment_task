import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:invorecruitmenttask/models/models.dart';

class FakeApiClient{

  Future<String> _loadJSONFromAssets() async {
    return await rootBundle.loadString('assets/MacroJSON.json');
  }

  Future<Macro> getMakro() async {
    String jsonString = await _loadJSONFromAssets();
    final makroJson = jsonDecode(jsonString);
    return Macro.fromJson(makroJson);
  }

}