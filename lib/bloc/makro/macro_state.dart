import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:invorecruitmenttask/models/macro.dart';

abstract class MacroState extends Equatable{
  const MacroState();

  @override
  List<Object> get props => [];
}

class MacroEmpty extends MacroState {}

class MacroLoading extends MacroState {}

class MacroLoaded extends MacroState{
  final Macro macro;

  MacroLoaded({@required this.macro}) : assert(macro != null);

  @override
  List<Object> get props => [macro];
}

class MacroError extends MacroState {}
