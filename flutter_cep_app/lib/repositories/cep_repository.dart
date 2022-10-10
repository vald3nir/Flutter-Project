import 'package:flutter_cep_app/models/address_model.dart';

abstract class CepRepository {
  Future<AddressModel> getAddressByCep(String cep);
}
