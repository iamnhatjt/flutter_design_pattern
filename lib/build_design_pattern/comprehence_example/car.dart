class Car {
  Car({
    this.name,
    this.price,
    this.brand,
    this.yearModel,
  });
  String? name;
  double? price;
  String? brand;
  int? yearModel;

  @override
  String toString() {
    return '$name $price $yearModel $brand';
  }
}
