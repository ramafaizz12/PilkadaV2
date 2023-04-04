part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? bottomindex;
  int? index;
  PageController pagecontrol = PageController();

  @override
  void initState() {
    super.initState();

    bottomindex = 0;
    pagecontrol = PageController(initialPage: bottomindex!);
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: pinkabu,
      body: LayoutBuilder(
        builder: (cont, conts) => Stack(children: [
          Image.asset(
            width: conts.maxWidth,
            'assets/backgroudsplash.png',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.only(top: conts.maxHeight * 0.14),
            child: Center(
              child: Column(
                children: [
                  Text("SELAMAT DATANG",
                      style: textpoppin.copyWith(
                          color: putih,
                          fontWeight: FontWeight.w700,
                          fontSize: conts.maxHeight * 0.02)),
                  Text("DI APLIKASI PILKADA",
                      style: textpoppin.copyWith(
                          color: pink,
                          fontWeight: FontWeight.w700,
                          fontSize: conts.maxHeight * 0.03)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: conts.maxHeight * 0.3),
            child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    bottomindex = value;
                  });
                },
                controller: pagecontrol,
                children: [
                  ViewSvg(
                    index: 0,
                    width: conts.maxWidth * 0.2,
                    gambar: 'assets/frame1.svg',
                    height: conts.maxHeight * 0.3,
                    katabody:
                        'Sistem Silajue adalah sebuah sistem layanan\n penjualan digital yang dibangun khusus untuk\n pejualan semen beku di Dinas Kesehatan Hewan\n Dan Peternakan Provinsi Sulawesi Selatan.',
                  ),
                  ViewSvg(
                    index: 1,
                    width: conts.maxWidth * 0.2,
                    gambar: 'assets/frame2.svg',
                    height: conts.maxHeight * 0.3,
                    katabody:
                        'Target pengguna kami adalah para peternak yang membutuhkan\n semen beku.',
                  ),
                  ViewSvg(
                      index: 2,
                      width: conts.maxWidth * 0.2,
                      gambar: 'assets/frame3.svg',
                      height: conts.maxHeight * 0.3,
                      katabody:
                          'Visi kami adalah mewujudkan pelayanan yang\n prima dan meningkatkan produksi ternak di\n Sulawesi Selatan.'),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: conts.maxHeight * 0.79),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (bottomindex == 0)
                    ? const Containerkecil()
                    : const ContainerkecilOff(),
                const SizedBox(
                  width: 5,
                ),
                (bottomindex == 1)
                    ? const Containerkecil()
                    : const ContainerkecilOff(),
                const SizedBox(
                  width: 5,
                ),
                (bottomindex == 2)
                    ? const Containerkecil()
                    : const ContainerkecilOff(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: conts.maxHeight * 0.84),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Center(
                child: ButtonUtama(
                    width: conts.maxWidth * 0.6,
                    height: conts.maxHeight * 0.05,
                    namabutton: (bottomindex == 2) ? 'MULAI' : 'LANJUTKAN',
                    voidcallback: () {
                      setState(() {
                        pagecontrol.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.linear);
                        if (bottomindex == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Wrapper(),
                              ));
                        }
                      });
                    }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Containerkecil extends StatelessWidget {
  const Containerkecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: birumuda, width: 5)),
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 6.5,
        height: 6.5,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }
}

class ContainerkecilOff extends StatelessWidget {
  const ContainerkecilOff({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.5,
      height: 17.5,
      decoration: BoxDecoration(
        color: birumuda.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
