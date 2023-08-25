import '../../../../core/_core_exports.dart';

class MyBasketButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final TextEditingController controller;
  final String text;

  const MyBasketButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.controller,
    required this.text, 
  }) : super(key: key);

  @override
  State<MyBasketButton> createState() => _MyBasketButtonState();
}

class _MyBasketButtonState extends State<MyBasketButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_basket,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('₺'),
          ),
        ],
      ),
    );
  }
}
