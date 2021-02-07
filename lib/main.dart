import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/bloc/simple_bloc_observer.dart';
import 'package:invorecruitmenttask/repository/fake_api_client.dart';
import 'package:invorecruitmenttask/repository/makro_repository.dart';

import 'bloc/makro/macro_bloc.dart';
import 'scenes/home_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final MakroRepository makroRepository = MakroRepository(fakeApiClient: FakeApiClient());
  runApp(
      MyApp(makroRepository: makroRepository)
  );
}

class MyApp extends StatelessWidget {
  final MakroRepository makroRepository;
  MyApp({Key key, @required this.makroRepository}) : assert(makroRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MacroBloc(makroRepository: makroRepository),
        child: HomePage(title: 'Task'),
      )
    );
  }
}
