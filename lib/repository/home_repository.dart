import 'dart:async';

import 'package:dio/dio.dart';
import 'package:feriados/models/feriado_model.dart';

class HomeRepository {
  final req = Dio();

  Future<List<FeriadoModel>> getFeriados() async {
    final result =
        await req.get('https://brasilapi.com.br/api/feriados/v1/2024');
    print('----------------------------------- ${result.data}');
    return result.data
        .map<FeriadoModel>(
          (p) => FeriadoModel.fromMap(p),
        )
        .toList();
  }
}
