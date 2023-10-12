import '../../../../core/_core_exports.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.line_style,
          color: Colors.grey,
        ),
      ),
    );
  }
}
