part of '../pages.dart';

class HalamanDataKorKomunitas extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon3.svg',
    'assets/icon4.svg',
  ];
  List nama = [
    'TPS',
    'RELAWAN',
    'DPT',
  ];

  HalamanDataKorKomunitas({super.key});

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
                itemCount: nama.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) => ContainerDatabaru(
                  fungsi: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (index == 0)
                                ? HalamanTemplateawal(
                                    nama: 'Data Tps',
                                    halamandata: HalamanDataTps())
                                : (index == 1)
                                    ? HalamanTemplateawal(
                                        nama: 'Relawan',
                                        halamandata: HalamanDatarelawancoba())
                                    : (index == 2)
                                        ? HalamanTemplateawal(
                                            nama: 'Data DPT',
                                            halamandata:
                                                const HalamanJumlahdpt())
                                        : const Text("")));
                  },
                  gambar: gambar[index],
                  nama: nama[index],
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
