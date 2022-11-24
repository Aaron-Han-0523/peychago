import 'package:flutter/material.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/basewidget/product_shimmer.dart';
import 'package:pcgo/view/basewidget/review_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/review_model.dart';
import '../../../provider/review_provider.dart';

class ReviewView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  ReviewView(
      {@required this.isHomePage,
      this.scrollController,
      this.sellerId});

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(() {
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

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

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

        print('========hello hello===>${reviewList.length}');

        return Column(children: [
          !reviewProvider.filterFirstLoading
              ? reviewList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? reviewList.length > 4
                              ? 4
                              : reviewList.length
                          : reviewList.length,
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection:
                      //     isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return ReviewWidget(reviewModel: reviewList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage, isEnabled: reviewProvider.firstLoading),
          reviewProvider.filterIsLoading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))
              : SizedBox.shrink(),
        ]);
      },
    );
  }
}
