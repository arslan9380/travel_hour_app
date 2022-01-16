import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/config/config.dart';
import 'package:travel_hour/pages/home.dart';
import 'package:travel_hour/pages/interest_pages/select_location.dart';
import 'package:travel_hour/pages/sign_in.dart';
import 'package:travel_hour/utils/next_screen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  afterSplash() {
    final SignInBloc sb = context.read<SignInBloc>();
    Future.delayed(Duration(milliseconds: 1200)).then((value) {
      Navigator.pushReplacement(
          context,
          // PageRouteBuilder(
          //   pageBuilder: (c, a1, a2) => SelectLocation(),
          //   transitionsBuilder: (c, anim, a2, child) =>
          //       FadeTransition(opacity: anim, child: child),
          //   transitionDuration: Duration(milliseconds: 2000),
          // transitionsBuilder:
          //     (_, Animation<double> animation, __, Widget child) {
          //   return SlideTransition(
          //     child: child,
          //     position: new Tween<Offset>(
          //       begin: const Offset(0.1, 0.0),
          //       end: Offset.zero,
          //     ).animate(animation),
          //   );
          // }
          // )
          MaterialPageRoute(builder: (context) => SelectLocation()));
      // sb.isSignedIn == true || sb.guestUser == true
      //     ? gotoHomePage()
      //     : gotoSignInPage();
    });
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.forward();
    afterSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image(
            image: AssetImage(Config().splashIcon),
            height: 120,
            width: 120,
            fit: BoxFit.contain,
          )),
    ));
  }
}
