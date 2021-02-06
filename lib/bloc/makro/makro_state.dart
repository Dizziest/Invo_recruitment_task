import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:invorecruitmenttask/models/makro.dart';

abstract class MakroState extends Equatable{
  const MakroState();

  @override
  List<Object> get props => [];
}

class MakroEmpty extends MakroState {}

class MakroLoading extends MakroState {}

class MakroLoaded extends MakroState{
  final Makro makro;

  MakroLoaded({@required this.makro}) : assert(makro != null);

  @override
  List<Object> get props => [makro];
}

class MakroError extends MakroState {}