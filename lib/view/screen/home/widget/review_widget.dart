import 'package:flutter/material.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/model/response/review_model.dart';
import '../../../../helper/price_converter.dart';
import '../../../../localization/language_constrants.dart';
import '../../../../provider/review_provider.dart';
import '../../../../utill/app_constants.dart';
import '../../review/review_detail_screen.dart';

class ReviewWidget extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;

  ReviewWidget({
    @required this.isHomePage,
    this.scrollController,
  });

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<ReviewProvider>(context, listen: false)
        .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void initState() {
    super.initState();

    _loadData(context, true);
  }

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    widget.scrollController?.addListener(() {
      if (widget.scrollController.position.maxScrollExtent ==
              widget.scrollController.position.pixels &&
          Provider.of<ReviewProvider>(context, listen: false)
                  .latestReviewList
                  .length !=
              0 &&
          !Provider.of<ReviewProvider>(context, listen: false)
              .filterIsLoading) {
        int pageSize = (Provider.of<ReviewProvider>(context, listen: false)
                    .latestPageSize /
                6)
            .ceil();
        offset = Provider.of<ReviewProvider>(context, listen: false).lOffset;

        if (offset < pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;

          print('end of the current page');
          // Provider.of<ReviewProvider>(context, listen: false)
          //     .showBottomLoader();

          Provider.of<ReviewProvider>(context, listen: false)
              .getLatestReviewList(offset, context);
        }
      }
    });

    return Consumer<ReviewProvider>(
      builder: (context, reviewProvider, child) {
        List<ReviewModel> reviewList = [];
        reviewList = reviewProvider.latestReviewList;

        return reviewList.length != 0
            ? ConstrainedBox(
                constraints: reviewList.length > 0
                    ? BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.width / 1.05)
                    : BoxConstraints(maxHeight: 0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: widget.scrollController,
                    itemCount: reviewList.length,
                    itemBuilder: (ctx, index) {
                      final ReviewModel reviewModel = reviewList[index];

                      return InkWell(
                        onTap: () async {
                          reviewModel.custom1 =
                              (int.parse(reviewModel.custom1 ?? "0") + 1)
                                  .toString();
                          // reviewModel.carInfo_id = 1;

                          Provider.of<ReviewProvider>(context, listen: false)
                              .updateReview(reviewModel);

                          await Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 1000),
                              pageBuilder: (context, anim1, anim2) =>
                                  ReviewDetailPage(
                                      isCreateScreen: false,
                                      reviewModel: reviewModel),
                            ),
                          );

                          setState(() {
                            Provider.of<ReviewProvider>(context, listen: false)
                                .getLatestReviewList(0, context, reload: true);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          // height: MediaQuery.of(context).size.width / 1.6,
                          margin: EdgeInsets.all(8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width / 1.7,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: Images.placeholder,
                                      fit: BoxFit.fitHeight,
                                      image: AppConstants.BASE_URL +
                                          "/" +
                                          (reviewModel.attachedFilepath1 ?? ""),
                                      // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                                      //     '/${bannerProvider.mainBannerList[index].photo}',
                                      imageErrorBuilder: (c, o, s) =>
                                          Image.asset(Images.placeholder_3x1,
                                              fit: BoxFit.fitHeight),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      Dimensions.PADDING_SIZE_SMALL),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(reviewModel.title ?? '',
                                          textAlign: TextAlign.center,
                                          style: robotoRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_DEFAULT,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                      Text(reviewModel.custom2 ?? '-',
                                          textAlign: TextAlign.center,
                                          style: robotoRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_DEFAULT,
                                              fontWeight: FontWeight.bold),
                                          // maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height:
                                            Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            reviewModel.grade.toString() ?? '',
                                            textAlign: TextAlign.center,
                                            style: robotoRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_DEFAULT,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                            // maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "${getTranslated('SCORE', context)}",
                                            textAlign: TextAlign.center,
                                            style: robotoRegular.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_DEFAULT,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                            // maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          // Text('some',
                                          //     textAlign: TextAlign.center,
                                          //     style: robotoRegular.copyWith(
                                          //       fontSize: Dimensions
                                          //           .FONT_SIZE_DEFAULT,
                                          //       fontWeight: FontWeight.w400,
                                          //       color: Colors.grey,
                                          //     ),
                                          //     // maxLines: 2,
                                          //     overflow: TextOverflow.ellipsis),
                                          // Text('20.308km',
                                          //     textAlign: TextAlign.center,
                                          //     style: robotoRegular.copyWith(
                                          //       fontSize: Dimensions
                                          //           .FONT_SIZE_DEFAULT,
                                          //       fontWeight: FontWeight.w400,
                                          //       color: Colors.grey,
                                          //     ),
                                          //     // maxLines: 2,
                                          //     overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: Dimensions.PADDING_SIZE_SMALL,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          reviewModel.title != null &&
                                                  reviewModel.title.length > 0
                                              ? Text(
                                                  PriceConverter.convertPrice(
                                                          context,
                                                          double.parse(
                                                              reviewModel
                                                                      .custom3 ??
                                                                  "0")) +
                                                      "${getTranslated('MONEY_UNIT', context)}",
                                                  style: titleRegular.copyWith(
                                                      color: Color(0XFF2434D7),
                                                      // decoration: TextDecoration.lineThrough,
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_DEFAULT,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : SizedBox.shrink(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                ' ${reviewModel.custom1 ?? 0}',
                                                style: robotoRegular.copyWith(
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_DEFAULT,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }))
            : BrandShimmer(isHomePage: true);
      },
    );
  }
}

class BrandShimmer extends StatelessWidget {
  final bool isHomePage;

  BrandShimmer({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1.3),
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
      ),
      itemCount: isHomePage ? 8 : 30,
      shrinkWrap: true,
      physics: isHomePage ? NeverScrollableScrollPhysics() : null,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled:
              Provider.of<ReviewProvider>(context).latestReviewList.length == 0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE, shape: BoxShape.circle))),
            Container(
                height: 10,
                color: ColorResources.WHITE,
                margin: EdgeInsets.only(left: 25, right: 25)),
          ]),
        );
      },
    );
  }
}
