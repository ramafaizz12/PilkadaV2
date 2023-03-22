part of '../pages.dart';

class HalamanDataa extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon3.svg',
    'assets/icon5.svg',
    'assets/icon7.svg',
    'assets/icon5.svg',
  ];
  List nama = ['TPS', 'RELAWAN', 'KOORDINATOR', 'PENERIMA AKSESORIS', 'CALEG'];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) => ContainerDatabaru(
                  fungsi: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanTemplateData(
                                  haldata: (index == 0)
                                      ? HalamanDataTps()
                                      : (index == 1)
                                          ? HalamanDataRelawan()
                                          : (index == 2)
                                              ? HalamanKoordinator()
                                              : (index == 3)
                                                  ? HalamanAksesoris()
                                                  : (index == 4)
                                                      ? HalamanCaleg()
                                                      : const Text(""),
                                )));
                  },
                  nama: nama[index],
                  gambar: gambar[index],
                  width: p1.maxWidth * 0.25,
                  height: p1.maxHeight * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
