import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/dataperolehansuara.dart';
import '../../services/AuthService.dart';

part 'dataperolehansuara_event.dart';
part 'dataperolehansuara_state.dart';

class DataperolehansuaraBloc
    extends Bloc<DataperolehansuaraEvent, DataperolehansuaraState> {
  DataperolehansuaraBloc({Authentication? auth})
      : super(DataperolehansuaraInitial()) {
    auth = Authentication();
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
    List<DataPerolehanSuara>? data = [];
    kedaerahlist() async {
      var dataprovinsi = await auth!.getdataprovinsi();
      var datakabupaten = await auth.getdatakabupaten();
      var datakecamatan = await auth.getdatakecamatan();
      listprovinsi = [
        for (var x in data!)
          dataprovinsi!
              .firstWhere((e) => e.id.toString() == x.Province_id.toString())
              .name
              .toString()
      ];
      listkabupaten = [
        for (var x in data!)
          datakabupaten!
              .firstWhere((e) => e.id.toString() == x.regency_id.toString())
              .name
              .toString()
      ];
      listkecamatan = [
        for (var x in data!)
          datakecamatan!
              .firstWhere((e) => e.id.toString() == x.district_id.toString())
              .name
              .toString()
      ];
    }

    on<DataperolehansuaraEvent>((event, emit) async {
      if (event is DataPerolehanSuaraConnect) {
        data = await auth!.getdataperolehansuara();
        await kedaerahlist();
        emit(DataPerolehanSuaraLoaded(
            data: data,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan,
            provinsi: listprovinsi));
      }

      if (event is DataPerolehanSuaraCreate) {
        var data = await auth!.createperolehansuara(
            jml_suara_sah: event.jml_suara_sah,
            jml_suara_tidaksah: event.jml_suara_tidaksah,
            suara_kandidat: event.suara_kandidat,
            ket: event.ket,
            Province_id: event.Province_id,
            regency_id: event.regency_id,
            district_id: event.district_id,
            tps_id: event.tps_id,
            formulir_c1: event.formulir_c1,
            saksi_id: event.saksi_id,
            data_kecurangan: event.data_kecurangan);
        emit(DpsUpdate(data: data));
      }
    });
  }
}
