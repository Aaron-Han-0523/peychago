import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pcgo/provider/banner_provider.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BannersView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<BannerProvider>(
          builder: (context, bannerProvider, child) {
            double _width = MediaQuery.of(context).size.width;

            // bannerProvider.getBannerJson(true, context);

            return Container(
              width: _width,
              height: _width * 0.6,
              child: bannerProvider.mainBannerJson != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            disableCenter: true,
                            onPageChanged: (index, reason) {
                              Provider.of<BannerProvider>(context,
                                      listen: false)
                                  .setCurrentIndex(index);
                            },
                          ),
                          itemCount: bannerProvider.totalIndex,
                          itemBuilder: (context, index, _) {
                            return InkWell(
                              onTap: () {
                                // _clickBannerRedirect(
                                //     context,
                                //     bannerProvider
                                //         .mainBannerList[index].resourceId,
                                //     bannerProvider.mainBannerList[index]
                                //                 .resourceType ==
                                //             'product'
                                //         ? bannerProvider
                                //             .mainBannerList[index].product
                                //         : null,
                                //     bannerProvider.mainBannerList[index]
                                //         .resourceType);
                              },
                              child: Container(
                                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(10),
                                  child:
                                      // Image.asset(
                                      //   Images.slide_img,
                                      //   fit: BoxFit.cover,
                                      //   // height: 35,
                                      // ),
                                      FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder,
                                    fit: BoxFit.cover,
                                    image: index == 0
                                        ? '${AppConstants.BASE_URL}/${bannerProvider.mainBannerJson.noticeImagePath}'
                                        : '${AppConstants.BASE_URL}/${bannerProvider.mainBannerJson.about2ImagePath}',
                                    // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                                    //     '/${bannerProvider.mainBannerList[index].photo}',
                                    imageErrorBuilder: (c, o, s) => Image.asset(
                                        Images.placeholder_3x1,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 5,
                          // left: 100,
                          right: 20,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0XFF2434D7),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              color: Color(0XFF1919A9),
                            ),
                            child: Row(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ]
                                    // bannerProvider.mainBannerList
                                    //     .map((banner) {
                                    //   int index = bannerProvider
                                    //       .mainBannerList
                                    //       .indexOf(banner);
                                    //   return Row(
                                    //     children: [
                                    //       index == bannerProvider.currentIndex
                                    //           ? Text('${index + 1}', style: TextStyle(color: Colors.white, fontSize: 12,),)
                                    //           : SizedBox(),
                                    //     ],
                                    //   );
                                    //   // 인디케이터
                                    //   // return TabPageSelectorIndicator(
                                    //   //   backgroundColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                                    //   //   borderColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                                    //   //   size: 10,
                                    //   // );
                                    // }).toList(),
                                    ),
                                Text(
                                  ' / ${bannerProvider.totalIndex}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  // : Center(child: Text('No banner available'))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: bannerProvider.mainBannerList == null,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorResources.WHITE,
                          )),
                    ),
            );
          },
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
