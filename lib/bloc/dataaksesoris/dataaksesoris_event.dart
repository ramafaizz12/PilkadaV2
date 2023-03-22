part of 'dataaksesoris_bloc.dart';

@immutable
abstract class DataaksesorisEvent {}

class DataaksesorisConnect extends DataaksesorisEvent {}

class DataaksesorisSearch extends DataaksesorisEvent {
  String? value;

  DataaksesorisSearch({this.value});
}
