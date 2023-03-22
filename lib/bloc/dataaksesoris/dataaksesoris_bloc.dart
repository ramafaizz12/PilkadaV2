import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dataaksesoris.dart';

import '../../services/AuthService.dart';

part 'dataaksesoris_event.dart';
part 'dataaksesoris_state.dart';

class DataaksesorisBloc extends Bloc<DataaksesorisEvent, DataaksesorisState> {
  DataaksesorisBloc({Authentication? auth}) : super(DataaksesorisInitial()) {
    auth = Authentication();
    List<Dataaksesoris>? data = [];
    List<Dataaksesoris>? foundusers = [];
    on<DataaksesorisEvent>((event, emit) async {
      if (event is DataaksesorisConnect) {
        data = await auth!.getdataaksesoris();
        foundusers = data;
        emit(Dataaksesorisloaded(data: data));
      }
      if (event is DataaksesorisSearch) {
        List<Dataaksesoris> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) =>
                  e.nama!.toLowerCase().contains(event.value!.toLowerCase()))
              .toList();
        }
        foundusers = results;
        emit(Dataaksesorisloaded(data: foundusers));
      }
    });
  }
}
