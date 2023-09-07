import 'package:get/get.dart';

class CounterService extends GetxController {
  var num = 0.obs;

  increment() => num++;

  decrement() => num--;
}
