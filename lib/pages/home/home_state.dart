import 'package:feriados/models/feriado_model.dart';

sealed class HomeState {}

class InitialHome implements HomeState {}

class LoadingHome implements HomeState {}

class LoadedHome implements HomeState {
  final List<FeriadoModel> feriados;
  LoadedHome({
    required this.feriados,
  });
}

class FailureHome implements HomeState {
  final String message;
  FailureHome({
    required this.message,
  });
}
