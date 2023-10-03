import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_app/feature/credential/view/_view_exports.dart';
import 'package:market_app/feature/note/_note_exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RxInt activeIndex = 0.obs;
  final CarouselController controller = CarouselController();
  final getirImages = [
    "assets/getirAnasayfa1.webp",
    "assets/getirAnasayfa2.webp",
    "assets/getirAnasayfa3.jpeg",
    "assets/getirAnasayfa4.webp",
    "assets/getirAnasayfa5.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              child: Container(
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
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "20 dk",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: getirImages.length,
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (index, reason) => activeIndex.value = index,
            ),
            itemBuilder: (context, index, realIndex) {
              final getirImage = getirImages[index];
              return buildImage(getirImage, index);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          buildIndicator(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Merhaba Selim!",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      hintText: "Getir'de ara",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: List.generate(
                  SameCodeType.values.length,
                  (index) {
                    final SameCodeType sameCodeType = SameCodeType.values[index];
                    return buildSameCodeWidget(sameCodeType);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String getirImage, int index) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        getirImage,
        fit: BoxFit.cover,
        width: 430,
      ),
    );
  }

  Widget buildIndicator() {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => AnimatedSmoothIndicator(
              activeIndex: activeIndex.value,
              count: getirImages.length,
              effect: const SlideEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.deepPurple,
                dotColor: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSameCodeWidget(SameCodeType type) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: type == SameCodeType.getirsepet ? 2 : 1,
      child: InkWell(
        onTap: () {
          switch (type) {
            case SameCodeType.getirsepet:
              Get.to(
                const SnackPage(),
              );
              break;
            case SameCodeType.getirYemek:
             Get.to(
                const FoodPage(),
              );
              break;
            case SameCodeType.getirCarsi:
              // TODO: Handle this case.
              break;
            case SameCodeType.getirSu:
              // TODO: Handle this case.
              break;
            case SameCodeType.getirBuyuk:
              // TODO: Handle this case.
              break;
            case SameCodeType.getirIs:
              // TODO: Handle this case.
              break;
            case SameCodeType.getirN11:
              // TODO: Handle this case.
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  type.toImage,
                  width: type == SameCodeType.getirsepet ? 150 : 85,
                  height: type == SameCodeType.getirsepet ? 130 : 85,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    type.toText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
