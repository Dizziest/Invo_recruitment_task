import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MacroEvent extends Equatable {
  const MacroEvent();
}

class FetchMacroEvent extends MacroEvent {

  FetchMacroEvent();

  @override
  List<Object> get props => [];

}