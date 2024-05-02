import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:feriados/models/feriado_model.dart';
import 'package:feriados/pages/home/home_state.dart';
import 'package:feriados/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  //final List<FeriadoModel> feriados = [];

  HomeCubit(this._homeRepository) : super(InitialHome());

  Future<List<FeriadoModel>> getFeriados() async {
    emit(LoadingHome());
    await Future.delayed(const Duration(seconds: 3));

    try {
      final feriados = await _homeRepository.getFeriados();
      emit(LoadedHome(feriados: feriados));

      return feriados;
    } catch (e, s) {
      log('Erro ao buscar dados', error: e, stackTrace: s);
      emit(FailureHome(message: 'Erro ao buscar dados'));
      rethrow;
    }
  }
}
