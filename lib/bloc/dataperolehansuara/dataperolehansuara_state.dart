part of 'dataperolehansuara_bloc.dart';

@immutable
abstract class DataperolehansuaraState {}

class DataperolehansuaraInitial extends DataperolehansuaraState {}

class DataPerolehanSuaraLoaded extends DataperolehansuaraState {
  List<DataPerolehanSuara>? data;
  List<String>? kabupaten;
  List<String>? kecamatan;
  List<String>? provinsi;

  DataPerolehanSuaraLoaded(
      {this.data, this.kabupaten, this.kecamatan, this.provinsi});
}

class DpsUpdate extends DataperolehansuaraState {
  bool? data;

  DpsUpdate({this.data});
}
