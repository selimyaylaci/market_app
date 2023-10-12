import '../../../../core/_core_exports.dart';

class FoodSuggestionsItem extends StatelessWidget {
  const FoodSuggestionsItem({
    super.key,
    required this.image,
    required this.text,
    required this.icons,
  });

  final String? image;
  final String text;
  final Icon? icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 213, 205, 239),
                ),
                child: icons,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(text),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset(
                    image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
