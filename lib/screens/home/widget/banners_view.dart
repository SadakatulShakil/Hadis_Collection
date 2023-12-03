import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class BannersView extends StatelessWidget {
  BannersView({Key? key}) : super(key: key);

  int currentIndex = 0;
  final List<String> mainBannerList = [
    'assets/images/one_hadis.png',
    'assets/images/two_hadis.png',
    'assets/images/three_hadis.png',
    'assets/images/four_hadis.png',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
      SizedBox(
      width: width,
      height: width * 0.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                // Provider.of<BannerProvider>(context, listen: false).setCurrentIndex(index);
              },
            ),
            itemCount: mainBannerList.isEmpty ? 1 : mainBannerList.length,
            itemBuilder: (context, index, _) {

              return InkWell(
                onTap: () {
                  // _clickBannerRedirect(context,
                  //     bannerProvider.mainBannerList![index].resourceId,
                  //     bannerProvider.mainBannerList![index].resourceType =='product'?
                  //     bannerProvider.mainBannerList![index].product : null,
                  //     bannerProvider.mainBannerList![index].resourceType);
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: mainBannerList[index], fit: BoxFit.cover,
                      image: mainBannerList[index],
                      imageErrorBuilder: (c, o, s) => Image.asset(mainBannerList[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      )
    ),

        const SizedBox(height: 5),
      ],
    );
  }


}

