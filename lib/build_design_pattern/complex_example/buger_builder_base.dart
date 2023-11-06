import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/build_design_pattern/complex_example/burge.dart';

abstract class BurgeBuilderBase {
  @protected
  late Burge burge;
  @protected
  late double price;

  void createBurger() => burge = Burge();

  Burge getBurger() => burge;

  void setBurgerPrice() => burge.setPrice(price);

  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}
