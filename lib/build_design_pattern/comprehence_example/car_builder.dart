import 'package:flutter_design_pattern/build_design_pattern/comprehence_example/car.dart';
import 'package:flutter_design_pattern/build_design_pattern/comprehence_example/i_car_base.dart';

class CarBuilder extends ICarBase {
  final Car car = Car();

  @override
  void setName(String name) {
    car.name = name;
  }

  @override
  void setBrand(String brand) {
    car.brand = brand;
  }

  @override
  void setPrice(double price) {
    car.price = price;
  }

  @override
  void setYearModel(int yearModel) {
    car.yearModel = yearModel;
  }

  Car builder() {
    return car;
  }
}
