import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/datadaerah.dart';
import 'package:pilkada/models/datagruprelawan.dart';
import 'package:pilkada/models/datarelawan.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datarelawan_event.dart';
part 'datarelawan_state.dart';

class DatarelawanBloc extends Bloc<DatarelawanEvent, DatarelawanState> {
  DatarelawanBloc({Authentication? auth}) : super(DatarelawanInitial()) {
    auth = Authentication();
    List<DataRelawan>? data = [];
    List<DataRelawan>? foundUsers = [];
    List<String> listgrup = [];
    List<String> listkabupaten = [];
    List<DataGruprelawan>? gruprelawan = [];
    List<DataGruprelawan>? foundgrup = [];
    kedaerahlist() async {
      var datagruprelawan = await auth!.getdatagruprelawan();
      var datakabupaten = await auth.getdatakabupaten();
      listgrup = [
        for (var x in data!)
          datagruprelawan!
              .firstWhere((e) => e.id.toString() == x.gruprelawan_id.toString())
              .nama_grup
              .toString()
      ];
      listkabupaten = [
        for (var x in data!)
          datakabupaten!
              .firstWhere((e) => e.id.toString() == x.regency_id.toString())
              .name
              .toString()
      ];
    }

    on<DatarelawanEvent>((event, emit) async {
      if (event is DataRelawanConnect) {
        data = await auth!.getdatarelawan(page: event.page);
        await kedaerahlist();
        foundUsers = data;
        emit(DataRelawanLoaded(
            data: foundUsers,
            gruprelawan: listgrup,
            datakabupaten: listkabupaten));
      }
      if (event is DataRelawanNew) {
        var data = await auth!.getdatarelawan();
        await kedaerahlist();
        emit(DataRelawanLoaded(
            data: data, gruprelawan: listgrup, datakabupaten: listkabupaten));
      }

      if (event is TambahDataRelawan) {
        var data = await auth!.createrelawan(
            nama: event.nama,
            nik: event.nik,
            // kordinator_id: event.kordinator_id,
            tempat_lahir: event.tempat_lahir,
            tanggal_lahir: event.tanggal_lahir,
            jkl: event.jkl,
            agama: event.agama,
            no_hp: event.no_hp,
            foto: event.foto,
            scan_ktp: event.scan_ktp,
            Province_id: event.Province_id,
            regency_id: event.regency_id,
            gruprelawan_id: event.gruprelawan_id);
        add(DataRelawanNew());
        emit(DataRelawanUpdate(data: data));
      }

      if (event is GrupRelawanConnect) {
        gruprelawan = await auth!.getdatagruprelawan();
        foundgrup = gruprelawan;
        emit(DataGruprelawanLoaded(data: gruprelawan));
      }
      if (event is DatarelawanSearch) {
        List<DataRelawan> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results = data!
              .where((e) =>
                  e.nama!.toLowerCase().contains(event.value!.toLowerCase()))
              .toList();
          await kedaerahlist();
        }
        foundUsers = results;

        emit(DataRelawanLoaded(
            data: foundUsers,
            datakabupaten: listkabupaten,
            gruprelawan: listgrup));
      }

      if (event is DataGrupRelawanSearch) {
        List<DataGruprelawan> results = [];
        if (event.value!.isEmpty) {
          results = gruprelawan!;
        } else {
          results = gruprelawan!
              .where((e) => e.nama_grup!
                  .toLowerCase()
                  .contains(event.value!.toLowerCase()))
              .toList();
          foundgrup = results;
          emit(DataGruprelawanLoaded(data: foundgrup));
        }
      }
    });
  }
}
