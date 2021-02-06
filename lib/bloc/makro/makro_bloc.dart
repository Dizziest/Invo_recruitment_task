import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/models/makro.dart';
import 'package:invorecruitmenttask/repository/repository.dart';

import 'makro_event.dart';
import 'makro_state.dart';

class MakroBloc extends Bloc<MakroEvent, MakroState> {

  final MakroRepository makroRepository;
  MakroBloc({@required this.makroRepository}) : assert(makroRepository != null), super(MakroEmpty());

  @override
  Stream<MakroState> mapEventToState(MakroEvent event) async* {
    if (event is FetchMakroEvent){
      yield MakroLoading();
      try{
        final Makro makro = await makroRepository.getMakro(event.id, event.date);
        yield MakroLoaded(makro: makro);
      } catch(error) {
        print(error);
        yield MakroError();
      }
    }
  }



}