import 'package:flutter/material.dart';
import 'package:pcgo/helper/price_converter.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:provider/provider.dart';
import '../../data/model/response/review_model.dart';
import '../../provider/review_provider.dart';
import '../screen/review/review_detail_screen.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewModel;

  ReviewWidget({@required this.reviewModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        reviewModel.custom1 = (int.parse(reviewModel.custom1??"0") + 1).toString();
        // reviewModel.carInfo_id = 1;

        Provider.of<ReviewProvider>(context, listen: false)
            .updateReview(reviewModel);

        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) => ReviewDetailPage(reviewModel: reviewModel, isCreateScreen: false),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.4,
        margin: EdgeInsets.all(5),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                fit: BoxFit.fitHeight,
                image: AppConstants.BASE_URL + "/" + (reviewModel.attachedFilepath1??""),
                // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                //     '/${bannerProvider.mainBannerList[index].photo}',
                imageErrorBuilder: (c, o, s) => Image.asset(
                    Images.placeholder_3x1,
                    fit: BoxFit.fitHeight),
              ),


              // Image.asset(
              //   Images.review_img1,
              //   fit: BoxFit.fitHeight,
              //   // height: 35,
              // ),
            ),
          ), // process quotation 실견적 최종견적
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reviewModel.title ?? '',
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.bold,
                    ),
                    // maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                ),
                Text(reviewModel.custom2 ?? '-',
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.bold,
                    ),
                    // maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(reviewModel.grade.toString() ?? '',
                        textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                    ),
                    Text('점',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: Dimensions
                            .FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Text('|',
                    //     textAlign: TextAlign.center,
                    //     style: robotoRegular.copyWith(
                    //       fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.grey,
                    //     ),
                    //     // maxLines: 2,
                    //     overflow: TextOverflow.ellipsis),
                    // Text('22년 8월',
                    //     textAlign: TextAlign.center,
                    //     style: robotoRegular.copyWith(
                    //       fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.grey,
                    //     ),
                    //     // maxLines: 2,
                    //     overflow: TextOverflow.ellipsis),
                    // Text('20.308km',
                    //     textAlign: TextAlign.center,
                    //     style: robotoRegular.copyWith(
                    //       fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.grey,
                    //     ),
                    //     // maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    // ),
                  ],
                ),
                // SizedBox(
                //   height: Dimensions.PADDING_SIZE_SMALL,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reviewModel.title != null && reviewModel.grade >= 0
                        ? Text(
                            PriceConverter.convertPrice(
                                context, double.parse(reviewModel.custom3??'0')) + '만원',
                            style: titleRegular.copyWith(
                              color: Color(0XFF2434D7),
                              // decoration: TextDecoration.lineThrough,
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        : SizedBox.shrink(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                        Text(' ${reviewModel.custom1 ?? "0"}',
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
