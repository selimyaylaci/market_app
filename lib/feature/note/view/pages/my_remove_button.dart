import '../../../../core/_core_exports.dart';

class MyRemoveButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  //final TextEditingController controller;

  const MyRemoveButton({
    Key? key,
    required this.icon,
    required this.onPressed,
   // required this.controller,
  }) : super(key: key);

  @override
  State<MyRemoveButton> createState() => _MyRemoveButtonState();
}

class _MyRemoveButtonState extends State<MyRemoveButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.remove),
        ],
      ),
    );
  }
}
