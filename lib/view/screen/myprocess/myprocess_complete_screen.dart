import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/app_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/textfield/custom_text_textfield.dart';
import '../home/home_screens.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class MyProcessCompletePage extends StatefulWidget {
  final ProcessModel processModel;

  const MyProcessCompletePage({Key key, this.processModel}) : super(key: key);
  @override
  State<MyProcessCompletePage> createState() => _MyProcessCompletePageState();
}

class _MyProcessCompletePageState extends State<MyProcessCompletePage>
    with TickerProviderStateMixin {

  String _localPath;
  TargetPlatform platform;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath());

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('LOADING_COMPLETE', context)}",).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  // margin: const EdgeInsets.all(8.0),
                  // padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.fromLTRB(
                                      24.0, 16.0, 4.0, 8.0),
                                  padding: const EdgeInsets.fromLTRB(
                                      4.0, 0.0, 4.0, 16.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0XFF2434D7),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image.asset(
                                          Images.certificate,
                                          height: 45,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('CERTIFICATE', context)}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff2007d6),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.fromLTRB(
                                      4.0, 16.0, 24.0, 8.0),
                                  padding: const EdgeInsets.fromLTRB(
                                      4.0, 0.0, 4.0, 16.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0XFF2434D7),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image.asset(
                                          Images.quotation,
                                          height: 45,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('FINAL_ESTIMATE', context)}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff2007d6),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  24.0, 0.0, 4.0, 0.0),
                              child: CustomElevatedButton(
                                onTap: () async {
                                  await _prepareSaveDir();
                                  String dir = _localPath; 	//path provider로 저장할 경로 가져오기

                                  FlutterDownloader.enqueue(
                                    url: AppConstants.BASE_URL + "/" + (widget.processModel.deregistrationPath??""),
                                    headers: {}, // optional: header send with url (auth token etc)
                                    savedDir: '${dir}/',
                                    // savedDir: '${dir.path}/',
                                    fileName: '${widget.processModel.deregistrationPath.substring(widget.processModel.deregistrationPath.lastIndexOf("/"))}',
                                    showNotification: true, // show download progress in status bar (for Android)
                                    openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                                  );
                                },
                                buttonText: "${getTranslated('DOWNLOAD', context)}",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  4.0, 0.0, 24.0, 0.0),
                              child: CustomElevatedButton(
                                onTap: () async {
                                  // String dir = "/storage/emulated/0/Download"; 	//path provider로 저장할 경로 가져오기
                                  await _prepareSaveDir();
                                  String dir = _localPath; 	//path provider로 저장할 경로 가져오기

                                  FlutterDownloader.enqueue(
                                    url: AppConstants.BASE_URL + "/" + (widget.processModel.finalProcessPath??""),
                                    headers: {}, // optional: header send with url (auth token etc)
                                    savedDir: '$dir/',
                                    fileName: '${widget.processModel.finalProcessPath.substring(widget.processModel.finalProcessPath.lastIndexOf("/"))}',
                                    showNotification: true, // show download progress in status bar (for Android)
                                    openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                                  );
                                },
                                buttonText: "${getTranslated('DOWNLOAD', context)}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Image.asset(
                        Images.finish_character,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CustomElevatedButton(
                                    onTap: () {
                                      Navigator.of(context).pop();

                                      // Navigator.of(context).pushAndRemoveUntil(
                                      //     MaterialPageRoute(builder: (_) => HomePage()),
                                      //         (route) => false);
                                    },
                                    buttonText: "${getTranslated('DISPOSAL_COMPLETE', context)}",
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomOutlinedButton(
                                      onTap: () {
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (_) => HomePage()),
                                                (route) => false);
                                      },
                                      buttonText: "${getTranslated('REVIEW_WRITE', context)}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
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
