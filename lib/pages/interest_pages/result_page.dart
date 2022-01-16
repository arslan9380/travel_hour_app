import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/constants/constants.dart';
import 'package:travel_hour/models/result_model.dart';
import 'package:travel_hour/pages/home.dart';
import 'package:travel_hour/pages/sign_in.dart';
import 'package:travel_hour/services/app_service.dart';
import 'package:travel_hour/utils/next_screen.dart';

class ResultPage extends StatefulWidget {
  final String? selectedCity;
  final String? selectedIntreset;

  ResultPage({this.selectedCity, this.selectedIntreset});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final List<ResultModel> allResult = [
    Constants.busanLuxury,
    Constants.busanResturant,
    Constants.seoulLuxury,
    Constants.seoulResturant
  ];
  ResultModel result = Constants.busanLuxury;

  @override
  void initState() {
    print(widget.selectedCity);
    print(widget.selectedIntreset);
    if (widget.selectedCity != null && widget.selectedIntreset != null) {
      String keyword = widget.selectedCity! + widget.selectedIntreset!;
      if (mounted) {
        result = allResult.firstWhere(
            (element) =>
                element.searchKey?.toLowerCase() == keyword.toLowerCase(),
            orElse: null);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Your Result",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, height: 1, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      final SignInBloc sb = context.read<SignInBloc>();
                      sb.isSignedIn == true || sb.guestUser == true
                          ? gotoHomePage()
                          : gotoSignInPage();
                    },
                    child: Text(
                      "Skip",
                      style: new TextStyle(
                          fontSize: 14.0, color: Colors.grey.withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "3/3",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  LinearPercentIndicator(
                    lineHeight: 6.0,
                    percent: 3 / 3,
                    padding: EdgeInsets.zero,
                    animateFromLastPercent: true,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        result.title!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      InkWell(
                          onTap: () {
                            AppService().openLink(context, result.refrence!);
                          },
                          child: Text(
                            result.refrence!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blue),
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      ReadMoreText(
                        result.descirption!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        trimLines: 8,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        height: MediaQuery.of(context).size.height * 0.25,
                        constraints: BoxConstraints(minHeight: 160),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(result.imagePath!))),
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                final SignInBloc sb = context.read<SignInBloc>();
                sb.isSignedIn == true || sb.guestUser == true
                    ? gotoHomePage()
                    : gotoSignInPage();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.4,
                        0.8,
                      ],
                      colors: [
                        Colors.blue,
                        Colors.blueAccent,
                        Colors.lightBlueAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: Text(
                  "Meeting Local Freinds",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  gotoHomePage() {
    final SignInBloc sb = context.read<SignInBloc>();
    if (sb.isSignedIn == true) {
      sb.getDataFromSp();
    }
    nextScreenReplace(context, HomePage());
  }

  gotoSignInPage() {
    nextScreenReplace(context, SignInPage());
  }
}
