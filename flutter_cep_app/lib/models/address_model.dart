import 'dart:convert';

class AddressModel {
  final String? cep;
  final String? logradouro;
  final String? complemento;

  AddressModel(
      {required this.cep, required this.logradouro, required this.complemento});

  Map<String, dynamic> toMap() {
    return {"cep": cep, "logradouro": logradouro, "complemento": complemento};
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
        cep: map["cep"],
        logradouro: map["logradouro"],
        complemento: map["complemento"]);
  }

  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json));
}
