part of 'pages.dart';

class HalamanTambahDataTps extends StatefulWidget {
  const HalamanTambahDataTps({super.key});

  @override
  _HalamanTambahDataTpsState createState() => _HalamanTambahDataTpsState();
}

class _HalamanTambahDataTpsState extends State<HalamanTambahDataTps> {
  Authentication auth = Authentication();
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  List<DataProvinsi?> dataprovinsi = [];

  List<String> itemprovinsi = [];
  List<String> itemkabupaten = [];
  List<String> itemkecamatan = [];
  String? selectedprovinsi;
  String? selectedkota;
  String? selectedkecamatan;
  TextEditingController notpscontrol = TextEditingController();
  TextEditingController perolehansuara = TextEditingController();
  TextEditingController keterangancontrol = TextEditingController();

  _tambahdata() {
    var itemkeca = datakecamatan
        .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
        .id;
    var itemka =
        datakabupaten.firstWhere((e) => e!.name.toString() == selectedkota)!.id;
    var itemprovinsi = dataprovinsi
        .firstWhere((e) => e!.name.toString() == selectedprovinsi)!
        .id;
    context.read<DatatpsBloc>().add(TambahDataTps(
        province_id: itemprovinsi.toString(),
        regency_id: itemka.toString(),
        district_id: itemkeca.toString(),
        tps: notpscontrol.text,
        ket: keterangancontrol.text));
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      auth.getdatakecamatan().then((value) => datakecamatan = value!);
      auth.getdatakabupaten().then((value) => datakabupaten = value!);

      auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocBuilder<DatatpsBloc, DatatpsState>(
          builder: (context, state) {
            if (state is DatatpsUpdate) {
              if (state.update == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Data Berhasil Disimpan',
                      confirmBtnColor: colorbiru,
                      confirmBtnTextStyle: textpoppin.copyWith(color: putih));
                });
              }
              if (state.update == false) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: 'Data Gagal Disimpan',
                      confirmBtnColor: colorbiru,
                      confirmBtnTextStyle: textpoppin);
                });
              }
            }

            return const SizedBox();
          },
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tambah Data TPS",
                textAlign: TextAlign.start,
                style: textpoppin.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Tps',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.06,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: notpscontrol,
                      onTap: () {
                        setState(() {
                          var data = dataprovinsi
                              .map((e) => e!.name.toString())
                              .toList();
                          itemprovinsi = data;
                        });
                      },
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Provinsi',
                    style: textpoppin,
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedprovinsi,
                    onChanged: (value) {
                      setState(() {
                        selectedprovinsi = value;
                        // var databaru = datakecamatan.firstWhere(
                        //     (e) => e!.id.toString().startsWith(item.toString()));
                        setState(() {
                          var item = dataprovinsi
                              .firstWhere((e) =>
                                  e!.name.toString() == selectedprovinsi)!
                              .id;
                          var databaru = datakabupaten
                              .where((ite) =>
                                  ite!.id.toString().contains(item.toString()))
                              .toList();
                          datakabupaten = databaru;
                          var data =
                              databaru.map((e) => e!.name.toString()).toList();
                          itemkabupaten = data;
                        });
                      });
                    },
                    items: itemprovinsi,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Provinsi',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kabupaten/Kota",
                      style: textpoppin,
                    ),
                    DropdownSearch<String>(
                      selectedItem: selectedkota,
                      onChanged: (value) {
                        setState(() {
                          selectedkota = value;
                          var item = datakabupaten
                              .firstWhere(
                                  (e) => e!.name.toString() == selectedkota)!
                              .id;
                          var databaru = datakecamatan
                              .where((ite) =>
                                  ite!.id.toString().contains(item.toString()))
                              .toList();
                          datakecamatan = databaru;
                          var data =
                              databaru.map((e) => e!.name.toString()).toList();
                          itemkecamatan = data;
                        });
                        setState(() {
                          selectedkota = value;
                        });
                      },
                      items: itemkabupaten,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                          baseStyle:
                              textpoppin.copyWith(fontWeight: FontWeight.w600),
                          dropdownSearchDecoration: InputDecoration(
                              hintText: 'Pilih Kabupaten / Kota',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    )
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kecamatan",
                    style: textpoppin,
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedkecamatan,
                    onChanged: (value) {
                      setState(() {
                        selectedkecamatan = value;
                      });
                    },
                    items: itemkecamatan,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Kecamatan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keterangan',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.06,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: keterangancontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.39, top: p1.maxHeight * 0.07),
                child: Row(
                  children: [
                    Container(
                      width: p1.maxWidth * 0.3,
                      height: p1.maxHeight * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: putih,
                          border: Border.all(color: colorbiru, width: 1.0)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                          border: Border.all(color: colorbiru, width: 1.0)),
                      child: TextButton(
                          onPressed: () {
                            _tambahdata();
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
        ),
      ]),
    );
  }
}
