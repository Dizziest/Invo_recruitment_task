import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/models/macro.dart';
import 'package:invorecruitmenttask/repository/repository.dart';

import 'macro_event.dart';
import 'macro_state.dart';

class MacroBloc extends Bloc<MacroEvent, MacroState> {

  final MakroRepository makroRepository;
  MacroBloc({@required this.makroRepository}) : assert(makroRepository != null), super(MacroEmpty());

  @override
  Stream<MacroState> mapEventToState(MacroEvent event) async* {
    if (event is FetchMacroEvent){
      yield MacroLoading();
      try{
        final Macro makro = await makroRepository.getMakro();
        yield MacroLoaded(macro: makro);
      } catch(error) {
        print(error);
        yield MacroError();
      }
    }
  }



}