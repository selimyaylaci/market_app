import 'package:flutter/material.dart';

class TypeTitlesItem extends StatelessWidget {
  const TypeTitlesItem({
    super.key,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  final dynamic title;
  final dynamic title2;
  final dynamic title3;
  final dynamic title4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              if (title2 != null)
                Text(
                  title2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              if (title3 != null)
                Text(
                  title3,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              if (title4 != null)
                const Text(
                  "Mutfaklar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),
        const Text(
          "Tümünü Gör (5)",
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
