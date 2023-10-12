import '../../../../core/_core_exports.dart';

class CarouselImageItem extends StatelessWidget {
  const CarouselImageItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: 380,
      ),
    );
  }
}
