// This is class  pizza
class Pizza {
  String? dought;
  String? sauce;
  String? toppings;

  Pizza({
    this.dought,
    this.sauce,
    this.toppings,
  });

  @override
  String toString() =>
      'Pizza(dought: $dought, sauce: $sauce, toppings: $toppings)';
}
