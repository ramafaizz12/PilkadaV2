import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataKordinator.dart';
import 'package:pilkada/services/AuthService.dart';

import '../../models/datakordinatorkomunitas.dart';

part 'datakoordinator_event.dart';
part 'datakoordinator_state.dart';

class DatakoordinatorBloc
    extends Bloc<DatakoordinatorEvent, DatakoordinatorState> {
  DatakoordinatorBloc({Authentication? auth})
      : super(DatakoordinatorInitial()) {
    auth = Authentication();
    on<DatakoordinatorEvent>((event, emit) async {
      if (event is DataKoordinatorConnect) {
        var dataprovinsi = await auth!.getdataprovinsi();
        var datakabupaten = await auth.getdatakabupaten();
        var datakecamatan = await auth.getdatakecamatan();
        var kordinatorkomunitas = await auth.getdatakordinatorkomunitas();
        var data = await auth.getdatakordinator(page: event.page);

        var listkomunitas = [
          for (var x in data!)
            kordinatorkomunitas!
                .firstWhere((e) =>
                    e.id.toString() == x.kordinatorKomunitas_id.toString())
                .nama_komunitas
                .toString()
        ];
        print(listkomunitas);
        var listkabupaten = [
          for (var x in data)
            datakabupaten!
                .firstWhere((e) => e.id.toString() == x.regency_id.toString())
                .name
                .toString()
        ];
        var listprovinsi = [
          for (var x in data)
            dataprovinsi!
                .firstWhere((e) => e.id.toString() == x.Province_id.toString())
                .name
                .toString()
        ];
        var listkecamatan = [
          for (var x in data)
            datakecamatan!
                .firstWhere((e) => e.id.toString() == x.district_id.toString())
                .name
                .toString()
        ];
        emit(DataKoordinatorLoaded(
            data: data,
            komunitas: listkomunitas,
            provinsi: listprovinsi,
            kabupaten: listkabupaten,
            kecamatan: listkecamatan));
      }
      if (event is TambahDataKoordinator) {
        var data = await auth!.createkoordinator(
          nama_lengkap: event.nama,
          nik: event.nik,
          tempat_lahir: event.tempat_lahir,
          tanggal_lahir: event.tanggal_lahir,
          jkl: event.jkl,
          agama: event.agama,
          no_hp: event.no_hp,
          foto: event.foto,
          scan_ktp: event.scan_ktp,
          Province_id: event.Province_id,
          regency_id: event.regency_id,
        );
        emit(DatakoorUpdate(data: data));
      }

      if (event is DataKoordinatorConnectKomunitas) {
        var data = await auth!.getdatakordinatorkomunitas(page: event.page);
        emit(DataKoordinatorKomunitas(data: data));
      }
    });
  }
}
