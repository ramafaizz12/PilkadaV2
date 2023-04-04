import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/datakandidat.dart';
import '../../services/AuthService.dart';

part 'datakandidat_event.dart';
part 'datakandidat_state.dart';

class DatakandidatBloc extends Bloc<DatakandidatEvent, DatakandidatState> {
  DatakandidatBloc({Authentication? auth}) : super(DatakandidatInitial()) {
    auth = Authentication();
    List<DataKandidat>? data = [];
    List<DataKandidat>? foundkandidat = [];
    on<DatakandidatEvent>((event, emit) async {
      if (event is DataKandidatConnect) {
        data = await auth!.getdatakandidat(page: event.page);
        foundkandidat = data;
        emit(DataKandidatLoaded(data: data));
      }

      if (event is TambahDataKandidat) {
        var data = await auth!.createkandidat(
            no_kandidat: event.no_kandidat,
            nama_kandidat: event.nama_kandidat,
            nama_wakil: event.nama_wakil,
            visi_misi: event.visi_misi,
            program: event.program,
            foto: event.foto);
        add(DataKandidatNew());
        emit(DatakandidatUpdate(update: data));
      }
      if (event is DataKandidatNew) {
        var data = await auth!.getdatakandidat();
        emit(DataKandidatLoaded(data: data));
      }
      if (event is DataKandidatSearch) {
        List<DataKandidat> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.nama_kandidat!
                  .toLowerCase()
                  .contains(event.value!.toLowerCase()))
              .toList();
        }
        foundkandidat = results;
        emit(DataKandidatLoaded(
          data: foundkandidat,
        ));
      }
    });
  }
}
