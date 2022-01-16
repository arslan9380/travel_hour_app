import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_hour/blocs/ads_bloc.dart';
import 'package:travel_hour/blocs/notification_bloc.dart';
import 'package:travel_hour/pages/blogs.dart';
import 'package:travel_hour/pages/bookmark.dart';
import 'package:travel_hour/pages/explore.dart';
import 'package:travel_hour/pages/profile.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/pages/states.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<IconData> iconList = [
    Feather.home,
    Feather.grid,
    Feather.list,
    Feather.bookmark,
    Feather.user
  ];


  void onTabTapped(int index) {
    setState(()=> _currentIndex = index);
   _pageController.animateToPage(index,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 300)
    );
   
  }


  Future configureAds ()async{
    await context.read<AdsBloc>().initiateAdsOnApp();
    context.read<AdsBloc>().loadAds();
  }



 @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0))
    .then((value) async{
      await context.read<NotificationBloc>().initFirebasePushNotification(context);
      await context.read<AdsBloc>().checkAdsEnable().then((isEnabled)async{
        if(isEnabled != null && isEnabled == true){
          debugPrint('ads enabled true');
          //configureAds();      /* enable this line to enable ads on the app */
          
        }else{
          debugPrint('ads enabled false');
        }
      });

    });
  }
  


  @override
  void dispose() {
    _pageController.dispose();
    context.read<AdsBloc>().dispose();
    super.dispose();
  }


  Future _onWillPop () async{
    if(_currentIndex != 0){
      setState (()=> _currentIndex = 0);
      _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }else{
      await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
    }
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await _onWillPop(),
      child: Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          backgroundColor: Colors.blue,
          activeColor: Colors.black54
          ,
          gapLocation: GapLocation.none,
          activeIndex: _currentIndex,
          inactiveColor: Colors.white,
          splashColor: Theme.of(context).primaryColor,
          iconSize: 22,
          onTap: (index) => onTabTapped(index),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),  
          children: <Widget>[
            Explore(),
            StatesPage(),
            BlogPage(),
            BookmarkPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
