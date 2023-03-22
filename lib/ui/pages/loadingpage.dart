part of 'pages.dart';

class LoadingPage extends StatelessWidget {
  static const String routename = '/loadingpage';
  // AnimationController controllerr = AnimationController(vsync: TickerProvider());

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            )));
    return Scaffold(
      backgroundColor: putihh,
      body: LayoutBuilder(
        builder: (p0, p1) => Stack(
          children: [
            Container(
                width: p1.maxWidth,
                height: p1.maxHeight,
                decoration: BoxDecoration(gradient: colorbarucontainer)),
            Animate(effects: [
              FadeEffect(duration: Duration(seconds: 2)),
              ScaleEffect(duration: Duration(seconds: 1))
            ], child: Center(child: SvgPicture.asset('assets/logo.svg'))),
          ],
        ),
      ),
    );
  }
}
