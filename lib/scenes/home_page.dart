import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invorecruitmenttask/bloc/makro/bloc.dart';
import 'package:invorecruitmenttask/constants/strings.dart';
import 'package:invorecruitmenttask/widgets/macro_widget.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MacroBloc, MacroState>(
        listener: (context, MacroState state){
          if (state is MacroLoaded){
            print('Loaded');
          }
        },
        builder: (context, MacroState state){
          if (state is MacroLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is MacroLoaded) {
            final macro = state.macro;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MacroWidget(
                    macro: macro
                  ),
                ],
              ),
            );
          }
          else if (state is MacroEmpty){
            BlocProvider.of<MacroBloc>(context).add(FetchMacroEvent());
            return Padding(
              padding: EdgeInsets.zero
            );
          }
          else {
            return Center(
              child: Text(
                Strings.errorOccured
              ),
            );
          }
        },
      ),
    );
  }
}



