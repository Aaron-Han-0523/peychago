import 'package:flutter/material.dart';

import 'package:pcgo/utill/dimensions.dart';
import 'package:provider/provider.dart';

import 'package:pcgo/provider/review_provider.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'review_view.dart';

class ReviewListScreen extends StatefulWidget {
  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<ReviewProvider>(context, listen: false)
        .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar("${getTranslated('REVIEW', context)}",).getAppbar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        Dimensions.HOME_PAGE_PADDING,
                        Dimensions.PADDING_SIZE_SMALL,
                        Dimensions.PADDING_SIZE_DEFAULT,
                        Dimensions.PADDING_SIZE_SMALL),
                    child: Column(
                      children: [
                        ReviewView(
                            isHomePage: false,
                            scrollController: _scrollController),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
