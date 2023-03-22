part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorState {}

class DatakoordinatorInitial extends DatakoordinatorState {}

class DataKoordinatorLoaded extends DatakoordinatorState {
  List<DataKordinator>? data;
  List<String>? kecamatan;
  List<String>? provinsi;
  List<String>? kabupaten;
  List<String>? komunitas;

  DataKoordinatorLoaded(
      {this.data,
      this.kecamatan,
      this.provinsi,
      this.kabupaten,
      this.komunitas});
}

class DatakoorUpdate extends DatakoordinatorState {
  bool? data;

  DatakoorUpdate({this.data});
}

class DataKoordinatorKomunitas extends DatakoordinatorState {
  List<DataKordinatorKomunitas>? data;

  DataKoordinatorKomunitas({this.data});
}
