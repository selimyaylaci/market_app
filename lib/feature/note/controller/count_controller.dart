import 'package:market_app/feature/note/domain/entities/arguments/create_snack_params.dart';
import '../../../core/_core_exports.dart';

class CountController extends GetxController {
  // counts
  //List<RxInt> counts = [];
  List<CreateSnackParams> snacks = [];
  //final List<CreateSnackParams> snack = [];
  //RxList<CreateSnackParams> snack = <CreateSnackParams>[].obs;
  RxList<CreateSnackParams> snack = <CreateSnackParams>[].obs;

  @override
  void onInit() {
    super.onInit();
    //counts = List.generate(SnackType.values.length, (index) => 0.obs);
    /*  snacks = List.generate(
      SnackType.values.length,
      (index) => CreateSnackParams(
        id: 'id $index',
        name: 'Snack $index',
        price: 'Tl $index',
        quantity:RxInt(0),
      ),  
    );  */
  }

  // count
  //RxInt count = 0.obs;
  void countAdd(CreateSnackParams product) {
    //counts[index]++;
    //////////snack[].quantity.value++;
    // count.value++;
    //create[index].quantity++;
    /////////snack.add(product);
    if (snack.contains(product)) {
      // var mı yok mu ona bakcaksın
      snack.add(product);
    } else {
      snack[0].quantity.value++;
    }
  }

  void countRemove(CreateSnackParams product) {
    //counts[index]--;
    ///////////snacks[index].quantity.value--;
    //count.value--;
    //SnackType.values[count.value--];
    //create[index].quantity--;
    ////////////snack.remove(product);
    if (snack.contains(product)) {
      snack.remove(product);
    } else {
      snack[0].quantity.value--;
    }
  }
}
