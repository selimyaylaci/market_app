import '../../../../core/_core_exports.dart';

class MyAddButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  //final TextEditingController controller;

  const MyAddButton({
    Key? key,
    required this.icon,
    required this.onPressed,
   // required this.controller,
  }) : super(key: key);

  @override
  State<MyAddButton> createState() => _MyAddButtonState();
}

class _MyAddButtonState extends State<MyAddButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.add,),
        ],
      ),
    );
  }
}
