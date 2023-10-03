import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/_core_exports.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final RxInt activeIndex = 0.obs;
  final CarouselController controller = CarouselController();
  final getirYemekImages = [
    "assets/getiryemek1.jpeg",
    "assets/getiryemek2.jpeg",
    "assets/getiryemek3.webp",
    "assets/getiryemek4.jpeg",
    "assets/getiryemek5.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 57,
              color: Colors.white,
            ),
            Container(
              height: kToolbarHeight,
              width: 280,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "skycity mh, 1234 Sokak,Bina no 2",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: kToolbarHeight,
              width: 50,
              color: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(
            const Duration(seconds: 3),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: getirYemekImages.length,
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  //viewportFraction: 1,
                  onPageChanged: (index, reason) => activeIndex.value = index,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  final getirYemekImage = getirYemekImages[index];
                  return buildYemekImage(getirYemekImage, index);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 400,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.question_mark),
                            ),
                            const Text("Ne Yesem?"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.diamond),
                            ),
                            const Text("Müdavim"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.access_time_filled_rounded),
                            ),
                            const Text("Siparişlerim"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.flatware),
                            ),
                            const Text("Masa"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                          const Text("İndirimli Restoranlar "),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                         // const Text("Getir Getirsin Restoranları"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                      //    const Text("Algida Lezzetleri"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                         // const Text("Yıldız Restoranları"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildYemekImage(String getirYemekImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        getirYemekImage,
        fit: BoxFit.cover,
        width: 380,
      ),
    );
  }
}
