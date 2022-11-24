import 'package:flutter/material.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/disposal/agree_screen.dart';
import 'package:pcgo/view/screen/home/widget/banners_view.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/banner_provider.dart';
import '../../../provider/review_provider.dart';
import '../../basewidget/button/main_page_text_button.dart';
import '../myprocess/myprocess_login_screen.dart';
import '../review/review_list_screen.dart';
import '../review/review_login_screen.dart';
import 'widget/review_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<BannerProvider>(context, listen: false)
        .getBannerJson(reload, context);
    // Provider.of<ReviewProvider>(context, listen: false)
    //     .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).highlightColor,
                  title: Center(
                      child: Image.asset(
                    Images.main_logo,
                    height: 25,
                  )),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      BannersView(),
                      SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                      // 폐차견적 버튼
                      MainPageTextButton(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AgreePage()))
                        },
                        buttonImage: Images.main_text_1,
                        detailButtonText: "${getTranslated('MAIN_TEXT1', context)}",
                      ),

                      // 내 진행 현황 버튼
                      MainPageTextButton(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyProcessLoginPage()))
                        },
                        buttonImage: Images.main_text_2,
                        detailButtonText: "${getTranslated('MAIN_TEXT2', context)}",
                      ),

                      // 후기 작성하기 버튼
                      MainPageTextButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReviewLoginPage()));
                          setState(() {

                          });
                        },
                        buttonImage: Images.main_text_3,
                        detailButtonText: "${getTranslated('MAIN_TEXT3', context)}",
                      ),

                      // 폐차GO 이용 후기 버튼
                      // 4개씩 가져오기
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Row(children: [
                          Container(
                            // width: 170,
                            child: Text(
                              "${getTranslated('MAIN_TEXT4', context)}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: const Divider(
                              // height: 20,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      ReviewWidget(
                        isHomePage: true,
                        scrollController: _scrollController,
                      ),

                      Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    padding: const EdgeInsets.all(8.0),
                                    backgroundColor: Color(0XFF2434D7),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ReviewListScreen(),
                                      ),
                                    );
                                  },
                                  child: Text("${getTranslated('MORE', context)}",),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      FooterPage(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
