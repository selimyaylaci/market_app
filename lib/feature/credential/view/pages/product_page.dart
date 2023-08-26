import '../../../../core/_core_exports.dart';
import '../../../note/controller/count_controller.dart';

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
        () => ListView.builder(
          itemCount: countController.snack.length,
          itemBuilder: (context, index) {
            final choose = countController.snack[index];
            return ListTile(
              title: Text(choose.name),
              subtitle: Text(choose.price),
              //leading:  Image.asset(choose.),
            );
          },
        ),
      ),
    );
  }
}
