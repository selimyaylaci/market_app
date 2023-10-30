import '../../../../core/_core_exports.dart';

class AppIconButtonTwo extends StatelessWidget {
  const AppIconButtonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.line_weight,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
