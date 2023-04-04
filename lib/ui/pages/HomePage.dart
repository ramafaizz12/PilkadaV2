part of 'pages.dart';

class HomePage extends StatefulWidget {
  dynamic haldata;
  dynamic dashboard;

  HomePage({super.key, this.haldata, this.dashboard});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int endTime = DateTime.fromMillisecondsSinceEpoch(1706580507 * 1000)
      .millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();

    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: pinkabu,
        body: Animate(
          effects: const [FadeEffect(duration: Duration(seconds: 2))],
          child: Stack(
            children: [
              SizedBox(
                  width: p1.maxWidth,
                  child: Image.asset(
                    'assets/backgroundhome.png',
                    fit: BoxFit.fitWidth,
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.03,
                    left: p1.maxWidth * 0.03,
                    right: p1.maxWidth * 0.03),
                child: HalamanHome(
                  haldata: widget.haldata,
                  dashboard: widget.dashboard,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.87,
                    left: p1.maxWidth * 0.03,
                    right: p1.maxWidth * 0.03),
                child: CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (context, time) {
                    if (time == null) {
                      return const Text('Game over');
                    }
                    return Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.08,
                        decoration: BoxDecoration(
                            color: putih,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hitung Mundur Pemilu 2024",
                              style: textpoppin,
                            ),
                            Text(
                              '${time.days} Hari ${time.hours} Jam ${time.min} Menit ${time.sec} Detik',
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ));
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: p1.maxHeight * 0.05, right: p1.maxHeight * 0.02),
                  child: SizedBox(
                    width: p1.maxWidth * 0.1,
                    height: p1.maxHeight * 0.1,
                    child: FittedBox(
                      child: FloatingActionButton(
                        elevation: 10,
                        backgroundColor: birumuda,
                        onPressed: () {
                          // context.read<AuthBloc>().add(LoggedOut());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HalamanSettings(),
                              ));
                        },
                        child: const Icon(
                          Icons.settings,
                          color: hitam,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
