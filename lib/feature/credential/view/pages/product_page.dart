import '../../../../core/_core_exports.dart';
import '../../../note/controller/count_controller.dart';
import '../../../note/domain/entities/arguments/create_snack_params.dart';
import '../../../note/domain/entities/snack_type.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<SnackType> discountedSnacks = [SnackType.cake, SnackType.tea, SnackType.water];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('my basket'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete_forever,
            ),
          ),
        ],
      ),
      body: GetBuilder(
        id: "selectedSnackList",
        init: CountController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.selectedSnackList.length,
                    itemBuilder: (context, index) {
                      final CreateSnackParams createSnackParams = controller.selectedSnackList[index];
                      final SnackType snackType = SnackType.values.firstWhere(
                        (element) => element.toId.toString() == createSnackParams.id,
                      );

                      final int quantity = createSnackParams.quantity;
                      //final int totalPrice = snackType.toPrice * quantity;
                      //final int totalPrice = int.tryParse(createSnackParams.price) ?? 0;
                      int originalPrice = snackType.toPrice;
                      bool discounted = discountedSnacks.contains(snackType);
                      int discountedPrice = discounted ? (originalPrice * 0.2).toInt() : originalPrice;
                      int totalPrice = discounted ? discountedPrice * quantity : originalPrice * quantity;

                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 197, 197, 197),
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      snackType.toImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    snackType.toText,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    //snackType.toPrice.toString(),
                                    "₺ ${totalPrice.toString()}",
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton.small(
                                  onPressed: () {
                                    controller.countRemove(
                                      snackType.toId.toString(),
                                    );
                                  },
                                  backgroundColor: Colors.white,
                                  heroTag: null,
                                  shape: const RoundedRectangleBorder(),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(1),
                                    shape: BoxShape.rectangle,
                                    color: Colors.deepPurple,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.selectedSnackList[index].quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                FloatingActionButton.small(
                                  onPressed: () {
                                    controller.countAdd(
                                      snackType.toId.toString(),
                                    );
                                  },
                                  backgroundColor: Colors.white,
                                  heroTag: null,
                                  shape: const RoundedRectangleBorder(),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: kToolbarHeight,
                        width: 250,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            )),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "₺ ${controller.totalSnackType().toString()}",
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
