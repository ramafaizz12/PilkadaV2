part of 'datakandidat_bloc.dart';

@immutable
abstract class DatakandidatEvent {}

class DataKandidatConnect extends DatakandidatEvent {
  String page;

  DataKandidatConnect({this.page = ''});
}

class TambahDataKandidat extends DatakandidatEvent {
  String? no_kandidat;
  String? nama_kandidat;
  String? nama_wakil;
  String? visi_misi;
  String? program;
  File? foto;

  TambahDataKandidat(
      {this.no_kandidat,
      this.nama_kandidat,
      this.nama_wakil,
      this.visi_misi,
      this.program,
      this.foto});
}

class DataKandidatNew extends DatakandidatEvent {}

class DataKandidatSearch extends DatakandidatEvent {
  String? value;

  DataKandidatSearch({this.value});
}
