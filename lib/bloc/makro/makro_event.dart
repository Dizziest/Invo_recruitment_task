import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MakroEvent extends Equatable {
  const MakroEvent();
}

class FetchMakroEvent extends MakroEvent {

  FetchMakroEvent();

  @override
  List<Object> get props => [];

}