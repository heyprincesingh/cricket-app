import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://m.media-amazon.com/images/I/41ruo5pL8DL._SX300_SY300_QL70_FMwebp_.jpg',
  'https://m.media-amazon.com/images/I/71lq1p2SHmL._SL1500_.jpg',
  'https://m.media-amazon.com/images/I/61uaV1wwDKL._SL1500_.jpg',
  'https://m.media-amazon.com/images/I/71lOMy4TDlL._SL1500_.jpg'
];

class AffiliateScreen extends StatelessWidget {
  const AffiliateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController _controller = CarouselSliderController();
    final List<Widget> imageSliders = imgList
        .map((item) => Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
              ),
        ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Affiliated Products",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff07151c),
        elevation: 10,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color(0xff111417),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff2f353f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                          enlargeCenterPage: false,
                          height: 200,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.9,
                        ),
                        carouselController: _controller,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff1c2026),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amkette Optimus BT 4 in 1 Wireless Keyboard",
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity, // Ensures proper wrapping
                              child: Text(
                                "Description: 𝗠𝘂𝗹𝘁𝗶-𝗗𝗲𝘃𝗶𝗰𝗲 𝗖𝗼𝗻𝗻𝗲𝗰𝘁𝗶𝘃𝗶𝘁𝘆: Seamlessly connect and switch between up to 4 devices via Bluetooth 5.0 and 2.4GHz.",
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
