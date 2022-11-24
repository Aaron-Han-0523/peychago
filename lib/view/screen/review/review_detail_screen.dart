import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/basewidget/rating_bar.dart';
import 'package:pcgo/view/basewidget/textarea/custom_textarea.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/model/response/clients_model.dart';
import '../../../data/model/response/process_model.dart';
import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/clients_provider.dart';
import '../../../provider/process_provider.dart';
import '../../../provider/review_provider.dart';
import '../../../utill/app_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/textfield/custom_text_textfield.dart';
import '../home/home_screens.dart';
import 'package:image_picker/image_picker.dart';

class ReviewDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ReviewDetailPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ReviewDetailPage> createState() => _ReviewDetailPageState();
}

class _ReviewDetailPageState extends State<ReviewDetailPage>
    with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  // int grade = 0;

  XFile image1;
  XFile image2;
  XFile image3;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media, int imageNum) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (imageNum == 0) image1 = img;
      if (imageNum == 1) image2 = img;
      if (imageNum == 2) image3 = img;
    });
  }

  void myAlert(int imageNum) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // title: Text('사진을 선택하세요.'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery, imageNum);
                    },
                    buttonText: '',
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text("${getTranslated('GALLERY', context)}",),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomElevatedButton(
                    //if user click this button. user can upload image from camera
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera, imageNum);
                    },
                    buttonText: '',
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text("${getTranslated('CAMERA', context)}",),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _previewImages(String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Container(
              // height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
            filePath,
            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
            fit: BoxFit.cover,
          )),
        );
      },
    );
  }

  Widget getImageItem(String filePath, int imageNum) {
    bool existFile = filePath != null ? true : false;

    return InkWell(
      onTap: () async {
        existFile
            ? _previewImages(filePath)
            : widget.isCreateScreen
                ? myAlert(imageNum)
                : null;
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xff666666)),
          // color: boxColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.width / 3.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: existFile
                      ? widget.reviewModel.attachedFilepath1 != null
                          ? FadeInImage.assetNetwork(
                              placeholder: Images.placeholder,
                              // fit: BoxFit.none,
                              fit: BoxFit.fitHeight,
                              // fit: BoxFit.cover,
                              image: AppConstants.BASE_URL + "/" + filePath,
                              imageErrorBuilder: (c, o, s) => Image.asset(
                                  Images.placeholder_3x1,
                                  fit: BoxFit.cover),
                            )
                          : Image.file(File(filePath))
                      : Center(
                          child: Icon(
                            Icons.add,
                            color: Color(0xffdddddd),
                          ),
                        ),
                ),
              ),
            ),
            false
                // existFile
                ? Positioned(
                    top: 5.0,
                    // left: 0.0,
                    right: 5.0,
                    // bottom: 0.0,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.green, width: 0.0),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500.0),
                          onTap: () {},
                          child: Icon(
                            Icons.cancel,
                            size: 20.0,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contentController = TextEditingController(
      text:
      "${getTranslated('CONTENTS_HINT', context)}",
    );

    if (widget.isCreateScreen == false) {
      titleController.text = widget.reviewModel.title;
      contentController.text = widget.reviewModel.content;
      gradeController.text = widget.reviewModel.grade.toString();
    } else {
      titleController.text = '';
      contentController.text = '';
      gradeController.text = '0';
    }

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('REVIEW_WRITE', context)}",).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Text(
                        "${getTranslated('REVIEW_GRADE', context)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      RatingBar(
                        isCreateScreen: widget.isCreateScreen,
                        controller: gradeController,
                        rating: double.parse(gradeController.text),
                        size: 35,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${getTranslated('TITLE', context)}",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText: "${getTranslated('TITLE_HINT', context)}",
                              isBorder: true,
                              boxColor: Colors.white,
                              controller: titleController,
                              enabled: widget.isCreateScreen ? true : false,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${getTranslated('CONTENTS', context)}",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextarea(
                              enabled: widget.isCreateScreen,
                              textEditingController: contentController,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${getTranslated('PICTURE_TEXT', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: getImageItem(
                                    image1 != null
                                        ? image1.path
                                        : widget.reviewModel.attachedFilepath1,
                                    0,
                                  ),
                                ),
                                Flexible(
                                  child: getImageItem(
                                    image2 != null
                                        ? image1.path
                                        : widget.reviewModel.attachedFilepath2,
                                    1,
                                  ),
                                ),
                                Flexible(
                                  child: getImageItem(
                                    image3 != null
                                        ? image1.path
                                        : widget.reviewModel.attachedFilepath3,
                                    2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      !widget.isCreateScreen
                          ? Container()
/*
                      Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 0.0, 4.0, 0.0),
                                    child: CustomOutlinedButton(
                                      onTap: () {
                                        Provider.of<ReviewProvider>(context,
                                                listen: false)
                                            .deleteReview(widget.reviewModel);

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (_) => HomePage(),
                                                ),
                                                (route) => false);
                                      },
                                      buttonText: '삭제',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        4.0, 0.0, 16.0, 0.0),
                                    child: CustomElevatedButton(
                                      onTap: () async {
                                        ReviewModel reviewModel = ReviewModel(
                                          review_id:
                                              widget.reviewModel.review_id,
                                          title: titleController.text,
                                          content: contentController.text,
                                          grade:
                                              int.parse(gradeController.text),
                                        );

                                        await Provider.of<ReviewProvider>(
                                                context,
                                                listen: false)
                                            .updateReview(reviewModel);

                                        await Provider.of<ReviewProvider>(
                                                context,
                                                listen: false)
                                            .getLatestReviewList(1, context,
                                                reload: true);

                                        Navigator.of(context).pop();
                                      },
                                      buttonText: '수정',
                                    ),
                                  ),
                                ),
                              ],
                            )
*/

                          : Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomElevatedButton(
                                    onTap: () async {
                                      ProcessModel processModel = await Provider.of<ProcessProvider>(context,
                                        listen: false)
                                        .getProcess();

                                      //ref custom1,2,3
                                      ReviewModel reviewModel = ReviewModel(
                                        title: titleController.text,
                                        content: contentController.text,
                                        grade: int.parse(gradeController.text),
                                        custom1: "0",
                                        custom2: processModel.model,
                                        custom3: NumberFormat('###,###,###,###').format(processModel.quotation??0),
                                        attachedFilepath1:
                                            image1 != null ? image1.path : null,
                                        attachedFilepath2:
                                            image2 != null ? image2.path : null,
                                        attachedFilepath3:
                                            image3 != null ? image3.path : null,
                                      );

                                      ApiResponse addReview =
                                          await Provider.of<ReviewProvider>(
                                                  context,
                                                  listen: false)
                                              .addReview(reviewModel);

                                      ClientsModel clientsModel = ClientsModel(
                                          custom1: addReview
                                              .response.data['review_id'].toString());

                                      Provider.of<ClientsProvider>(context,
                                              listen: false)
                                          .updateClientsForReviewId(
                                              clientsModel);

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (_) => HomePage(),
                                          ),
                                          (route) => false);
                                    },
                                    buttonText: "${getTranslated('ENROLL', context)}",
                                  ),
                                  SizedBox(
                                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
