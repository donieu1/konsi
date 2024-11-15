import 'dart:convert';

class CepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? unidade;
  String? bairro;
  String? localidade;
  String? uf;
  String? estado;
  String? regiao;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  @override
  String toString() {
    return 'CepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, unidade: $unidade, bairro: $bairro, localidade: $localidade, uf: $uf, estado: $estado, regiao: $regiao, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }

  CepModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? unidade,
    String? bairro,
    String? localidade,
    String? uf,
    String? estado,
    String? regiao,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    return CepModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      unidade: unidade ?? this.unidade,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      estado: estado ?? this.estado,
      regiao: regiao ?? this.regiao,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'unidade': unidade,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
      'regiao': regiao,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] ?? 'vazio',
      logradouro: map['logradouro'] ?? 'vazio',
      complemento: map['complemento'] ?? 'vazio',
      unidade: map['unidade'] ?? 'vazio',
      bairro: map['bairro'] ?? 'vazio',
      localidade: map['localidade'] ?? 'vazio',
      uf: map['uf'] ?? 'vazio',
      estado: map['estado'] ?? 'vazio',
      regiao: map['regiao'] ?? 'vazio',
      ibge: map['ibge'] ?? 'vazio',
      gia: map['gia'] ?? 'vazio',
      ddd: map['ddd'] ?? 'vazio',
      siafi: map['siafi'] ?? 'vazio',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) => CepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CepModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cep == cep &&
      other.logradouro == logradouro &&
      other.complemento == complemento &&
      other.unidade == unidade &&
      other.bairro == bairro &&
      other.localidade == localidade &&
      other.uf == uf &&
      other.estado == estado &&
      other.regiao == regiao &&
      other.ibge == ibge &&
      other.gia == gia &&
      other.ddd == ddd &&
      other.siafi == siafi;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
      logradouro.hashCode ^
      complemento.hashCode ^
      unidade.hashCode ^
      bairro.hashCode ^
      localidade.hashCode ^
      uf.hashCode ^
      estado.hashCode ^
      regiao.hashCode ^
      ibge.hashCode ^
      gia.hashCode ^
      ddd.hashCode ^
      siafi.hashCode;
  }
}

