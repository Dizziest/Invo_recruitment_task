import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MakroEvent extends Equatable {
  const MakroEvent();
}

class FetchMakroEvent extends MakroEvent {
  final int id;
  final String date;

  FetchMakroEvent({@required this.id, @required this.date}) : assert(id != null && date != null);

  @override
  List<Object> get props => [
    id,
    date
  ];

}