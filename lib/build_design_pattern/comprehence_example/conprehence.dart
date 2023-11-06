import 'package:flutter/foundation.dart';
import 'package:flutter_design_pattern/build_design_pattern/comprehence_example/car.dart';
import 'package:flutter_design_pattern/build_design_pattern/comprehence_example/car_builder.dart';

void implement() {
  final CarBuilder carExample = CarBuilder()
    ..setBrand('brand')
    ..setName('name')
    ..setPrice(1000)
    ..setYearModel(2023);
  final Car car = carExample.builder();
  if (kDebugMode) {
    print(car.toString());
  }
}
