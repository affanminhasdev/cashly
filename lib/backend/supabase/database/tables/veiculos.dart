import '../database.dart';

class VeiculosTable extends SupabaseTable<VeiculosRow> {
  @override
  String get tableName => 'veiculos';

  @override
  VeiculosRow createRow(Map<String, dynamic> data) => VeiculosRow(data);
}

class VeiculosRow extends SupabaseDataRow {
  VeiculosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VeiculosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get crlv => getField<String>('crlv');
  set crlv(String? value) => setField<String>('crlv', value);

  String? get renavam => getField<String>('renavam');
  set renavam(String? value) => setField<String>('renavam', value);

  String? get nomePropietario => getField<String>('nome_propietario');
  set nomePropietario(String? value) =>
      setField<String>('nome_propietario', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get especie => getField<String>('especie');
  set especie(String? value) => setField<String>('especie', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  String? get combustivel => getField<String>('combustivel');
  set combustivel(String? value) => setField<String>('combustivel', value);

  String? get marcaModelo => getField<String>('marca_modelo');
  set marcaModelo(String? value) => setField<String>('marca_modelo', value);

  String? get anoFabricacao => getField<String>('ano_fabricacao');
  set anoFabricacao(String? value) => setField<String>('ano_fabricacao', value);

  String? get anoModelo => getField<String>('ano_modelo');
  set anoModelo(String? value) => setField<String>('ano_modelo', value);

  String? get cor => getField<String>('cor');
  set cor(String? value) => setField<String>('cor', value);

  String? get lotacao => getField<String>('lotacao');
  set lotacao(String? value) => setField<String>('lotacao', value);

  String? get capacidadeDeCarga => getField<String>('capacidade_de_carga');
  set capacidadeDeCarga(String? value) =>
      setField<String>('capacidade_de_carga', value);

  String? get potencia => getField<String>('potencia');
  set potencia(String? value) => setField<String>('potencia', value);

  String? get cilindradas => getField<String>('cilindradas');
  set cilindradas(String? value) => setField<String>('cilindradas', value);

  String? get cpfCnpjProprietario => getField<String>('cpf_cnpj_proprietario');
  set cpfCnpjProprietario(String? value) =>
      setField<String>('cpf_cnpj_proprietario', value);

  String? get empresa => getField<String>('empresa');
  set empresa(String? value) => setField<String>('empresa', value);

  String? get placaCarro => getField<String>('placa_carro');
  set placaCarro(String? value) => setField<String>('placa_carro', value);
}
