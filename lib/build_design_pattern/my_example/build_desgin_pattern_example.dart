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

// concrete builder
class CheesePizzaConcrete extends PizzaBuilder {
  @override
  void buildDough() {
    pizza.dough = "Thin crust";
  }

  @override
  void buildSauce() {
    pizza.sauce = "Tomato sauce";
  }

  @override
  void buildToppings() {
    pizza.toppings = "Mozzarella cheese";
  }
}
