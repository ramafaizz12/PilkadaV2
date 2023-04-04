part of 'pages.dart';

class HalamanTambahDataSaksi extends StatefulWidget {
  const HalamanTambahDataSaksi({super.key});

  @override
  _HalamanTambahDataSaksiState createState() => _HalamanTambahDataSaksiState();
}

class _HalamanTambahDataSaksiState extends State<HalamanTambahDataSaksi> {
  List<String> items = ['ada'];

  TextEditingController kandidatcontrol = TextEditingController();
  TextEditingController suarasahcontrol = TextEditingController();
  TextEditingController tpscontrol = TextEditingController();
  TextEditingController suaratidaksahcontrol = TextEditingController();

  TextEditingController keterangancontrol = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedvalue;
    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: putih,
        body: Stack(
          children: [
            Container(
              width: p1.maxWidth,
              height: p1.maxHeight,
              decoration: const BoxDecoration(gradient: colorbackground),
            ),
            SvgPicture.asset(
              'assets/bg_atas.svg',
              width: p1.maxWidth,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.01, right: p1.maxHeight * 0.02),
                child: SizedBox(
                  width: p1.maxWidth * 0.1,
                  height: p1.maxHeight * 0.1,
                  child: FittedBox(
                    child: FloatingActionButton(
                      elevation: 10,
                      backgroundColor: colororange,
                      onPressed: () {
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
                                        borderRadius: BorderRadius.circular(15),
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
                                        borderRadius: BorderRadius.circular(15),
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
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
                      child: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: p1.maxHeight * 0.08,
                  left: p1.maxWidth * 0.03,
                  right: p1.maxWidth * 0.03),
              child: SizedBox(
                height: p1.maxHeight,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: p1.maxHeight * 0.04,
                          right: p1.maxWidth * 0.04,
                          left: p1.maxWidth * 0.04),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tambah Data Saksi",
                              textAlign: TextAlign.start,
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.02,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Provinsi",
                                  style: textpoppin,
                                ),
                                DropdownSearch<String>(
                                  selectedItem: selectedvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                    });
                                  },
                                  items: items,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                          baseStyle: textpoppin.copyWith(
                                              fontWeight: FontWeight.w600),
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                  hintText: 'Pilih Provinsi',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kabupaten / Kota",
                                  style: textpoppin,
                                ),
                                DropdownSearch<String>(
                                  selectedItem: selectedvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                    });
                                  },
                                  items: items,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                          baseStyle: textpoppin.copyWith(
                                              fontWeight: FontWeight.w600),
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                  hintText:
                                                      'Pilih Kabupaten / Kota',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kecamatan",
                                  style: textpoppin,
                                ),
                                DropdownSearch<String>(
                                  selectedItem: selectedvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                    });
                                  },
                                  items: items,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                          baseStyle: textpoppin.copyWith(
                                              fontWeight: FontWeight.w600),
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                  hintText: 'Pilih Kecamatan',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                ),
                              ],
                            ),
                           
                            SizedBox(
                              height: p1.maxHeight * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: p1.maxWidth * 0.1,
                                  top: p1.maxHeight * 0.02),
                              child: Row(
                                children: [
                                  Container(
                                    width: p1.maxWidth * 0.3,
                                    height: p1.maxHeight * 0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: putih,
                                        border: Border.all(
                                            color: colorbiru, width: 1.0)),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Batal",
                                          style: textpoppin.copyWith(
                                              fontSize: p1.maxHeight * 0.02,
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
                                        borderRadius: BorderRadius.circular(15),
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
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: Text(
                                                  "Data Disimpan",
                                                  style: textpoppin,
                                                ),
                                                content: const Icon(
                                                  Icons.check,
                                                  color: colororange,
                                                )),
                                          );
                                        },
                                        child: Text(
                                          "Simpan",
                                          style: textpoppin.copyWith(
                                              fontSize: p1.maxHeight * 0.02,
                                              color: putih,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
