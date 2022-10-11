import 'dart:convert';

class AddressModel {
  final String? cep;
  final String? street;
  final String? district;
  final String? city;

  AddressModel(
      {required this.cep,
      required this.street,
      required this.district,
      required this.city});

  Map<String, dynamic> toMap() {
    return {
      "cep": cep,
      "logradouro": street,
      "bairro": district,
      "localidade": city
    };
  }

  @override
  String toString() {
    String address = "";
    if (cep?.isNotEmpty == true) {
      address += "CEP: $cep\n";
    }
    if (street?.isNotEmpty == true) {
      address += "Rua: $street\n";
    }
    if (district?.isNotEmpty == true) {
      address += "Bairro: $district\n";
    }
    if (city?.isNotEmpty == true) {
      address += "Cidade: $city\n";
    }
    return address;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
        cep: map["cep"],
        street: map["logradouro"],
        district: map["bairro"],
        city: map["localidade"]);
  }

  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json));
}
