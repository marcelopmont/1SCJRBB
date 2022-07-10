import 'package:favorites_cryptos/domain/entities/cripto_entity.dart';
import 'package:intl/intl.dart';

class CriptoModel {
  final oCcy = NumberFormat("#,##0.00", "pt_br");

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

  factory CriptoModel.fromJson(json) => CriptoModel(
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
        price: formataValor(double.parse(price)),
        rank: rank,
      );

  String formataValor(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
}
