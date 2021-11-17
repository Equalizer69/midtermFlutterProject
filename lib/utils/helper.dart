import 'car_model.dart';
import 'dummy_data.dart';

class CarMethods {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void deleteCar(int id) {
    DUMMY_DATA.removeWhere((e) => e.id == id);
  }

  void editCar(Car car, int i) {
    DUMMY_DATA.replaceRange(i, i + 1, [car]);
  }
}
