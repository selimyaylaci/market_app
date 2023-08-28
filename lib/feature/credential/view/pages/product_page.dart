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
  final countController = Get.put(CountController());
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
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: countController.selectedSnackList.length,
                  itemBuilder: (context, index) {
                    final SnackType snackType = SnackType.values[index];
                    return ListTile(
                      title: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                //height: 110,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 150,
                                  vertical: 50,
                                ), // horizontal: yatay, vertical : dikey
                                //padding: const EdgeInsets.all(10),
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
                                      countController.countAdd(
                                        CreateSnackParams(
                                          id: snackType.toId.toString(),
                                          name: snackType.toText,
                                          price: snackType.toPrice.toString(),
                                          quantity: 1.obs,
                                        ),
                                      );
                                    },
                                    backgroundColor: const Color.fromARGB(255, 190, 156, 250),
                                    heroTag: null,
                                    child: const Icon(Icons.add),
                                  ),
                                  Obx(
                                    () => Text(
                                      countController.snackList[index].quantity.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  FloatingActionButton.small(
                                    onPressed: () {
                                      countController.countRemove(
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
                            snackType.toPrice.toString(),
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
            ],
          ),
        ),
      ),
      /* Obx(
        () => ListView.builder(
          itemCount: countController.selectedSnackList.length,
          itemBuilder: (context, index) {
            final choose = countController.selectedSnackList[index];
            return ListTile(
              title: Text(choose.name),
              subtitle: Text(choose.price),
              //leading:  Image.asset(choose.),
            );
          },
        ),
      ), */
    );
  }
}
