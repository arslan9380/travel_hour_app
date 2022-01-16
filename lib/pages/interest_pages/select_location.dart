import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/constants/constants.dart';
import 'package:travel_hour/pages/home.dart';
import 'package:travel_hour/pages/interest_pages/select_interest.dart';
import 'package:travel_hour/pages/sign_in.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/inputfield_widget.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  TextEditingController searchCon = TextEditingController();
  String selectedLocation = Constants.busan;
  List<String> cities = [
    Constants.busan,
    Constants.seoul,
  ];
  List<String> imagesPath = [
    "assets/images/busan.jpg",
    "assets/images/seoul.jpg",
  ];

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
                      "Choose the area \nyou are interest",
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
                  Text(
                    "1/3",
                    style: new TextStyle(
                        fontSize: 14.0, color: Colors.grey.withOpacity(0.8)),
                  ),
                  LinearPercentIndicator(
                    lineHeight: 6.0,
                    percent: 1 / 3,
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
            Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: InputFieldWidget(
                  prefixIcon: Icons.search,
                  hint: "Search for city",
                  controller: searchCon,
                  onChange: (val) {
                    setState(() {});
                  },
                )),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  itemCount: cities.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return cities[index]
                            .toLowerCase()
                            .startsWith(searchCon.text.toLowerCase())
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                selectedLocation = cities[index];
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              height: MediaQuery.of(context).size.height * 0.23,
                              constraints: BoxConstraints(minHeight: 160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(imagesPath[index]))),
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cities[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                            selectedLocation == cities[index]
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        fontSize:
                                            selectedLocation == cities[index]
                                                ? 22
                                                : 20),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Korea",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: selectedLocation ==
                                                    cities[index]
                                                ? 18
                                                : 16),
                                      ),
                                      Spacer(),
                                      if (selectedLocation == cities[index])
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: 28,
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectInterest(
                              selectedCity: selectedLocation,
                            )));
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
                  "Next",
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
