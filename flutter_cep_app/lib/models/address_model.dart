class AddressModel {
  final String? cep;
  final String? logradouro;
  final String? complemento;

  AddressModel(this.cep, this.logradouro, this.complemento);

  // AddressModel.fromJson(Map<String, dynamic> json) {
  //   cep = json['cep'];
  //   logradouro = json['logradouro'];
  //   complemento = json['complemento'];
  //   bairro = json['bairro'];
  //   localidade = json['localidade'];
  //   uf = json['uf'];
  //   ibge = json['ibge'];
  //   gia = json['gia'];
  //   ddd = json['ddd'];
  //   siafi = json['siafi'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['cep'] = cep;
  //   data['logradouro'] = logradouro;
  //   data['complemento'] = complemento;
  //   data['bairro'] = bairro;
  //   data['localidade'] = localidade;
  //   data['uf'] = uf;
  //   data['ibge'] = ibge;
  //   data['gia'] = gia;
  //   data['ddd'] = ddd;
  //   data['siafi'] = siafi;
  //   return data;
  // }
}
