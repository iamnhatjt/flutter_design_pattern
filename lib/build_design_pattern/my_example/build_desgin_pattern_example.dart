// This is class  pizza

class Pizza {
  String? dough;
  String? sauce;
  String? toppings;

  Pizza({
    this.dough,
    this.sauce,
    this.toppings,
  });

  @override
  String toString() =>
      'Pizza(dought: $dough, sauce: $sauce, toppings: $toppings)';
}

// Builder
abstract class PizzaBuilder {
  late Pizza pizza;

  void buildDough();
  void buildSauce();
  void buildToppings();
}
