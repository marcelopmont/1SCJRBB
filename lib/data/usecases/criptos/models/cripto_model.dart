import 'package:example_blocs/domain/entities/cripto_entity.dart';

class CriptoModel {
  CriptoModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.rank,
    required this.price,
  });

  String id;
  String name;
  String logo;
  String rank;
  String price;
  bool favorite = false;

  factory CriptoModel.fromJson(Map json) => CriptoModel(
        id: json['id'].toString(),
        name: json['name'],
        logo: json['logo_url'],
        rank: json['rank'],
        price: json['price'],
      );

  CriptoEntity toEntity() => CriptoEntity(
        id: id,
        name: name,
        logo: logo,
        price: price,
        rank: rank,
      );
}
