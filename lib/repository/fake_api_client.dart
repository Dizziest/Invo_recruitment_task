import 'package:invorecruitmenttask/models/models.dart';

class FakeApiClient{

  Makro getMakro(int userId, String date){
    Makro makro = Makro(1,'06.02.2021', 2000, 100, 200, 50);
    makro.meals = getMeals(1);
    return makro;
  }

  List<Meal> getMeals(int makroId){
    List<Meal> list = <Meal>[
      Meal(
        'II Śniadanie',
        'ze szpinakiem, twarożkiem z suszonymi pomidorami i oliwkami i rzodkiewką',
        400,
        81.1,
        200,
        15.0,
        100,
        38.8,
        50,
        [
          Alergen('Skorupiaki', 'assets/images/crab.png'),
          Alergen('Orzeszki ziemne', 'assets/images/peanut.png'),
          Alergen('Mleko', 'assets/images/milk.png')
        ]
      )
    ];

    return list;
  }

}