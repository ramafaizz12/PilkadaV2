part of '../pages.dart';

class HalamanDataAdmin extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon2.svg',
    'assets/icon3.svg',
    'assets/icon4.svg',
    'assets/icon5.svg',
    'assets/icon6.svg',
    'assets/icon7.svg',
    'assets/icon8.svg',
    'assets/icon1.svg',
    'assets/icon5.svg',
  ];
  List nama = [
    'TPS',
    'GRUP RELAWAN',
    'RELAWAN',
    'JUMLAH DPT',
    'KOORDINATOR',
    'SAKSI TPS',
    'AKSESORIS',
    'CALEG',
    'HPS',
    'KORKOMUNITAS',
  ];

  HalamanDataAdmin({super.key});

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
                                        nama: 'Data Grup Relawan',
                                        halamandata: HalamanDataGruprelawan())
                                    : (index == 2)
                                        ? HalamanTemplateawal(
                                            nama: 'Relawan',
                                            halamandata:
                                                HalamanDatarelawancoba())
                                        : (index == 3)
                                            ? HalamanTemplateawal(
                                                nama: 'Data Jumlah DPT',
                                                halamandata: const HalamanJumlahdpt())
                                            : (index == 4)
                                                ? HalamanTemplateawal(
                                                    nama: 'Data Koordinator',
                                                    halamandata:
                                                        HalamanKoordinator())
                                                : (index == 5)
                                                    ? HalamanTemplateawal(
                                                        nama: 'Data Saksi',
                                                        halamandata:
                                                            HalamanDataSaksitps())
                                                    : (index == 6)
                                                        ? HalamanTemplateawal(
                                                            nama:
                                                                'Penerima Aksesoris',
                                                            halamandata:
                                                                HalamanAksesoris())
                                                        : (index == 7)
                                                            ? HalamanTemplateawal(
                                                                nama:
                                                                    'Data Caleg',
                                                                halamandata:
                                                                    const HalamanCaleg())
                                                            : (index == 8)
                                                                ? HalamanTemplateawal(
                                                                    nama:
                                                                        'Hasil Perolehan Suara',
                                                                    halamandata:
                                                                        HalamanPerolehanSuara())
                                                                : (index == 9)
                                                                    ? HalamanTemplateawal(
                                                                        nama:
                                                                            'Komunitas Koordinator',
                                                                        halamandata:
                                                                            HalamanKordinatorKomunitas())
                                                                    : const Text(
                                                                        "")));
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
