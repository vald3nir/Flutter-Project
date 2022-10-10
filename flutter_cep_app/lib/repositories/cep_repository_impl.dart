import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_cep_app/models/address_model.dart';

import 'cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<AddressModel> getAddressByCep(String cep) async {
    try {
      final result = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      return AddressModel.fromMap(result.data);
    } on DioError catch (e) {
      log("error on getAddressByCep", error: e);
      throw Exception("error on getAddressByCep");
    }
  }
}
