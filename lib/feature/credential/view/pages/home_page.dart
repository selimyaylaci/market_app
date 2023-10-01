import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market_app/feature/credential/view/_view_exports.dart';
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
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getirsepetremove.png",
                              width: 150,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getir",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getiryemekremove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getiryemek",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getircarsiremove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getirçarşı",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getirsuremove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getirsu",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getirbuyukremove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getirbüyük",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getirisremove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "getiriş",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/getirn11remove.png",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "n11",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
}
