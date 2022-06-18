class CriptoEntity {
  CriptoEntity({
    required this.id,
    required this.name,
    required this.logo,
    required this.price,
    required this.rank,
  });

  String id;
  String name;
  String logo;
  String price;
  String rank;
  bool favorite = false;
}
