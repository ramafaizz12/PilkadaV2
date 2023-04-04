import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/saksitps.dart';

part 'datasaksi_event.dart';
part 'datasaksi_state.dart';

class DatasaksiBloc extends Bloc<DatasaksiEvent, DatasaksiState> {
  DatasaksiBloc({Authentication? auth}) : super(DatasaksiInitial()) {
    auth = Authentication();
    List<DataSaksi>? data = [];
    List<DataSaksi>? foundUsers = [];
    List<String> listkecamatan = [];
    List<String> listkabupaten = [];
    kedaerahlist() async {
      var datakabupaten = await auth!.getdatakabupaten();
      var datakecamatan = await auth.getdatakecamatan();

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

    on<DatasaksiEvent>((event, emit) async {
      if (event is DatasaksiConnect) {
        data = await auth!.getdatasaksi(page: event.page);
        await kedaerahlist();
        emit(DataSaksiLoaded(
            data: data, kabupaten: listkabupaten, kecamatan: listkecamatan));
      }
      if (event is TambahDatasaksi) {
        try {
          var data = await auth!.createsaksi(
              nama_saksi: event.nama_saksi,
              nik: event.nik,
              alamat: event.alamat,
              no_hp: event.no_hp,
              email: event.email,
              saksi: event.saksi,
              Province_id: event.Province_id,
              regency_id: event.regency_id,
              district_id: event.district_id,
              tps_id: event.tps_id,
              role: event.role,
              password: event.password);
          add(DatasaksiNew());
          emit(DatasaksiUpdate(update: data));
        } catch (e) {
          emit(DatasaksiFailure(error: e.toString()));
        }
      }

      if (event is DatasaksiNew) {
        var data = await auth!.getdatasaksi();
        emit(DataSaksiLoaded(data: data));
      }

      if (event is DatasaksiSearch) {
        List<DataSaksi> results = [];
        if (event.value!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results = data!
              .where((e) => e.nama_saksi!
                  .toLowerCase()
                  .contains(event.value!.toLowerCase()))
              .toList();
          await kedaerahlist();
        }
        foundUsers = results;
        emit(DataSaksiLoaded(
            data: foundUsers,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
    });
  }
}
