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
                      //for (var index = 0; index < controller.selectedSnackList.length; index++) { }
                      final CreateSnackParams createSnackParams = controller.selectedSnackList[index];
                      final SnackType snackType = SnackType.values.firstWhere(
                        (element) => element.toId.toString() == createSnackParams.id,
                      );

                      final int quantity = createSnackParams.quantity;
                      final int totalPrice = snackType.toPrice * quantity;

                      return ListTile(
                        title: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 150,
                                    vertical: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(snackType.toImage),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FloatingActionButton.small(
                                      onPressed: () {
                                        controller.countAdd(
                                          snackType.toId.toString(),
                                        );
                                      },
                                      backgroundColor: const Color.fromARGB(255, 190, 156, 250),
                                      heroTag: null,
                                      child: const Icon(Icons.add),
                                    ),
                                    Text(
                                      controller.selectedSnackList[index].quantity.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    FloatingActionButton.small(
                                      onPressed: () {
                                        controller.countRemove(
                                          snackType.toId.toString(),
                                        );
                                      },
                                      backgroundColor: const Color.fromARGB(255, 190, 156, 250),
                                      heroTag: null,
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              //snackType.toPrice.toString(),
                              "Total : ${totalPrice.toString()} ₺",
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(snackType.toText),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      controller.totalSnackType().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
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
