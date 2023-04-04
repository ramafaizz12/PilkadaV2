import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Datadpt.dart';
import '../../services/AuthService.dart';

part 'datadpt_event.dart';
part 'datadpt_state.dart';

class DatadptBloc extends Bloc<DatadptEvent, DatadptState> {
  DatadptBloc({Authentication? auth}) : super(DatadptInitial()) {
    auth = Authentication();
    List<Datadpt>? data = [];
    List<Datadpt>? foundusers = [];
    List<String> listprovinsi = [];
    List<String> listkabupaten = [];
    List<String> listkecamatan = [];
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

    on<DatadptEvent>((event, emit) async {
      if (event is Datadptconnect) {
        data = await auth!.getdatadpt(page: event.page);
        await kedaerahlist();
        foundusers = data;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchProvinsi) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results = data!
              .where((e) => e.Province_id!.contains(event.value!))
              .toList();
          await kedaerahlist();
        }
        foundusers = results;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchKabupaten) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results =
              data!.where((e) => e.regency_id!.contains(event.value!)).toList();
          await kedaerahlist();
        }
        foundusers = results;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchKecamatan) {
        List<Datadpt> results = [];

        if (event.value!.isEmpty) {
          results = data!;
          await kedaerahlist();
        } else {
          results = data!
              .where((e) => e.district_id!.contains(event.value!))
              .toList();
          await kedaerahlist();
        }
        foundusers = results;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
      if (event is DatadptSearchnama) {
        List<Datadpt> results = [];

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
        foundusers = results;
        emit(DatadptLoaded(
            data: foundusers,
            dataprovinsi: listprovinsi,
            datakabupaten: listkabupaten,
            datakecamatan: listkecamatan));
      }
    });
  }
}
