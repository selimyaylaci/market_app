import 'package:market_app/feature/credential/view/pages/product_page.dart';
import 'package:market_app/feature/note/_note_exports.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: GetBuilder(
                init: CountController(),
                id: "snackList",
                builder: (controller) {
                  return ListView.builder(
                    itemCount: SnackType.values.length,
                    itemBuilder: (context, index) {
                      final SnackType snackType = SnackType.values[index];
                      return ListTile(
                        title: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  /* margin: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                    //vertical: 5,
                                  ), */
                                  margin: const EdgeInsets.only(
                                    right: 2,
                                    left: 30,
                                  ),
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 190, 156, 250),
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FloatingActionButton.small(
                                      onPressed: () {
                                        controller.countAdd(snackType.toId.toString());
                                      },
                                      backgroundColor: Colors.white,
                                      heroTag: null,
                                      shape: const RoundedRectangleBorder(),
                                      child: const Icon(
                                        Icons.add,
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
                                        controller.snackList[index].quantity.toString(),
                                        style: const TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
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
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "₺ ${snackType.toPrice.toString()}",
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
