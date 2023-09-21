import 'package:market_app/feature/credential/view/pages/product_page.dart';
import 'package:market_app/feature/note/_note_exports.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnackType> discountedSnacks = [SnackType.cake, SnackType.tea, SnackType.water];
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
      body: Column(
        children: [
          Expanded(
            child: GetBuilder(
              init: CountController(),
              id: "snackList",
              builder: (controller) {
                return GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  childAspectRatio: (1 / 1.4),
                  children: List.generate(
                    SnackType.values.length,
                    (index) {
                      final SnackType snackType = SnackType.values[index];
                      bool discounted = discountedSnacks.contains(snackType);
                      int originalPrice = snackType.toPrice;

                      int discountedPrice = discounted ? (originalPrice * 0.2).toInt() : originalPrice;
                      return ListTile(
                        title: SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 136,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: controller.selectedBasket(
                                          snackType.toId.toString(),
                                        ),
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
                                  controller.iconChange(
                                    snackType.toId.toString(),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          //"₺ ${snackType.toPrice.toString()}",
                                          "₺ ${originalPrice.toString()}",
                                          style: TextStyle(
                                            color: discounted ? Colors.grey : Colors.deepPurple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            decoration: discounted ? TextDecoration.lineThrough : null,
                                          ),
                                        ),
                                        if (discounted)
                                          Text(
                                            "₺ ${discountedPrice.toString()}",
                                            style: const TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Text(
                                      snackType.toText,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





