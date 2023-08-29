import 'package:market_app/feature/credential/view/pages/product_page.dart';
import 'package:market_app/feature/note/_note_exports.dart';
import 'package:market_app/feature/note/domain/entities/arguments/create_snack_params.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TextEditingController addController = TextEditingController();
  // TextEditingController removeController = TextEditingController();
  final countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snacks"),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(const ProductPage());
              },
              icon: const Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: SnackType.values.length,
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
                                    countController.countAdd(snackType.toId.toString());
                                  /*   countController.countAdd(
                                      CreateSnackParams(
                                        id: snackType.toId.toString(),
                                        name: snackType.toText,
                                        price: snackType.toPrice.toString(),
                                        quantity: 1.obs,
                                      ),
                                    ); */
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
    );
  }
}
// 2 farklı listen olsun secilenler ve ürün listen