part of 'pages.dart';

class HalamanSettings extends StatefulWidget {
  const HalamanSettings({super.key});

  @override
  State<HalamanSettings> createState() => _HalamanSettingsState();
}

class _HalamanSettingsState extends State<HalamanSettings> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: pinkabu,
      body: LayoutBuilder(
          builder: (p0, p1) => Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: p1.maxHeight * 0.1,
                        left: p1.maxWidth * 0.07,
                        right: p1.maxWidth * 0.07),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: p1.maxHeight * 0.05,
                            ),
                          ),
                          SizedBox(width: p1.maxWidth * 0.23),
                          Text("Pengaturan",
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: hitam,
                                  fontSize: p1.maxHeight * 0.02))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HalamanTemplateBaru(
                                  nama: 'Profil',
                                  halamandata: HalamanProfile(),
                                ),
                              ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                bottom: p1.maxHeight * 0.02,
                                top: p1.maxHeight * 0.02),
                            width: p1.maxWidth * 0.83,
                            height: p1.maxHeight * 0.05,
                            decoration: BoxDecoration(
                                color: putih,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                      offset: const Offset(2, 4))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Lihat Profil",
                                style: textpoppin,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: Text(
                                  "Apakah anda yakin ingin keluar ?",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                content: Row(
                                  children: [
                                    Container(
                                      width: p1.maxWidth * 0.3,
                                      height: p1.maxHeight * 0.07,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: putih,
                                          border: Border.all(
                                              color: colorbiru, width: 1.0)),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          child: Text(
                                            "Tidak",
                                            style: textpoppin.copyWith(
                                                color: colorbiru,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                    SizedBox(
                                      width: p1.maxWidth * 0.01,
                                    ),
                                    Container(
                                      width: p1.maxWidth * 0.3,
                                      height: p1.maxHeight * 0.07,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: hitam.withOpacity(0.2),
                                                offset: const Offset(3, 3))
                                          ],
                                          color: colorbiru,
                                          border: Border.all(
                                              color: colorbiru, width: 1.0)),
                                      child: TextButton(
                                          onPressed: () {
                                            context
                                                .read<AuthBloc>()
                                                .add(LoggedOut());
                                            setState(() {});
                                            // Navigator.pushReplacement(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           LoginPage(),
                                            //     ));
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Ya",
                                            style: textpoppin.copyWith(
                                                color: putih,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                  ],
                                )),
                          );
                        },
                        child: Container(
                            width: p1.maxWidth * 0.83,
                            height: p1.maxHeight * 0.05,
                            decoration: BoxDecoration(
                                color: putih,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                      offset: const Offset(2, 4))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Keluar",
                                style: textpoppin,
                              ),
                            )),
                      )
                    ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                        width: p1.maxWidth,
                        'assets/backgroundsettings.png',
                        fit: BoxFit.fitWidth),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: p1.maxHeight * 0.08),
                        child: SvgPicture.asset(
                          'assets/frame4.svg',
                          fit: BoxFit.fill,
                        ),
                      ))
                ],
              )),
    );
  }
}
