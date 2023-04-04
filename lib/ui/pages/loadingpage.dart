part of 'pages.dart';

class LoadingPage extends StatelessWidget {
  static const String routename = '/loadingpage';

  const LoadingPage({super.key});
  // AnimationController controllerr = AnimationController(vsync: TickerProvider());

  @override
  Widget build(BuildContext context) {
    var state = context.read<AuthBloc>().state;
    if (state is AuthAuthenticated) {
      print("login berhasil");
    }
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            )));
    return Scaffold(
      backgroundColor: putihh,
      body: LayoutBuilder(
        builder: (p0, p1) => Stack(
          children: [
            Container(
                width: p1.maxWidth,
                height: p1.maxHeight,
                decoration: const BoxDecoration(gradient: colorbarucontainer)),
            Animate(effects: const [
              FadeEffect(duration: Duration(seconds: 2)),
              ScaleEffect(duration: Duration(seconds: 1))
            ], child: Center(child: SvgPicture.asset('assets/logo.svg'))),
          ],
        ),
      ),
    );
  }
}
