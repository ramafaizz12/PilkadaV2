part of 'pages.dart';

class DataPerolehanSuara extends StatefulWidget {
  const DataPerolehanSuara({super.key});

  @override
  State<DataPerolehanSuara> createState() => _DataPerolehanSuaraState();
}

class _DataPerolehanSuaraState extends State<DataPerolehanSuara> {
  File? _filefoto;
  // File? _scanktp;
  XFile? pictureFile;
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  List<DataProvinsi?> dataprovinsi = [];
  List<DataGruprelawan> datagruprelawan = [];
  List<String> itemgruprelawan = [];
  List<String> itemprovinsi = [];
  List<String> itemjeniskelamin = ['laki-laki', 'perempuan'];
  List<String> itemagama = ['ISLAM', 'KRISTEN', 'HINDU', 'BUDDHA'];
  List<String> itemkabupaten = [];

  String? selectedprovinsi;
  String? selectedkota;
  String? selectedkecamatan;
  String? selectedjkl;
  String? selectedagama;
  String? selectedgrup;

  NIKModel? nikResult;

  ///Validate NIK informations

  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _tambahdata() {
    context.read<DataperolehansuaraBloc>().add(DataPerolehanSuaraCreate(
        jml_suara_sah: jumlahsuarasah.text,
        jml_suara_tidaksah: jumlahsuaratdksah.text,
        suara_kandidat: suarakandidat.text,
        ket: ketcontrol.text,
        Province_id: dataprovinsi
            .firstWhere((e) => e!.name.toString() == selectedprovinsi)!
            .id
            .toString(),
        district_id: datakecamatan
            .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
            .id
            .toString(),
        regency_id: datakabupaten
            .firstWhere((e) => e!.name.toString() == selectedkota)!
            .id
            .toString(),
        tps_id: tpsid.text,
        formulir_c1: _filefoto,
        data_kecurangan: datakecurangan.text));
  }

  TextEditingController jumlahsuarasah = TextEditingController();
  TextEditingController datakecurangan = TextEditingController();
  TextEditingController jumlahsuaratdksah = TextEditingController();
  TextEditingController tpsid = TextEditingController();
  TextEditingController saksiid = TextEditingController();
  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController ketcontrol = TextEditingController();
  TextEditingController tanggalahircontrol = TextEditingController();

  TextEditingController agamacontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();
  TextEditingController gruprelawancontrol = TextEditingController();
  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController suarakandidat = TextEditingController();

  @override
  initState() {
    super.initState();
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatagruprelawan().then((value) => datagruprelawan = value!);

    tanggalahircontrol.text = '';
  }

  @override
  Widget build(BuildContext context) {
    print(selectedprovinsi);
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocBuilder<DataperolehansuaraBloc, DataperolehansuaraState>(
          builder: (context, state) {
            if (state is DpsUpdate) {
              if (state.data == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Data Berhasil Disimpan',
                      confirmBtnColor: colorbiru,
                      onConfirmBtnTap: () {
                        Navigator.pop(context);
                      },
                      confirmBtnTextStyle: textpoppin.copyWith(color: putih));
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumlah Suara Sah',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: jumlahsuarasah,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Jumlah Suara Sah',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumlah Suara Tidak Sah',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: jumlahsuaratdksah,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Jumlah Suara Tidak Sah',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suara Kandidat',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: suarakandidat,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Suara Kandidat',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ket',
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                            color: putih,
                            border: Border.all(width: 1.0, color: hitam),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: ketcontrol,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Keterangan',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(top: 5, left: 5)),
                        ),
                      )
                    ],
                  ),
                ],
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
                    selectedItem: selectedprovinsi,
                    onChanged: (value) {
                      setState(() {
                        selectedprovinsi = value;
                      });
                    },
                    asyncItems: (String? filter) => auth.getprovinsilist(
                        provinsi: selectedprovinsi.toString()),
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
                    "Kabupaten / Kota",
                    style: textpoppin,
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedkota,
                    onChanged: (value) {
                      setState(() {
                        selectedkota = value;
                      });
                    },
                    asyncItems: (String? filter) => auth.getkabupatenlist(
                        provinsi: selectedprovinsi.toString()),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Kabupaten / Kota',
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
                    asyncItems: (String? filter) => auth.getkecamatanlist(
                        provinsi: selectedkota.toString()),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Kecamatan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TPS',
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                            color: putih,
                            border: Border.all(width: 1.0, color: hitam),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: tpsid,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan TPS',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(top: 5, left: 5)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Kecurangan',
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Container(
                        width: p1.maxWidth,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                            color: putih,
                            border: Border.all(width: 1.0, color: hitam),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: datakecurangan,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Data Kecurangan',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(top: 5, left: 5)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: p1.maxWidth * 0.4,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: birumuda,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: hitam.withOpacity(0.2),
                              offset: const Offset(3, 3))
                        ]),
                    child: TextButton(
                        onPressed: () {
                          pickfoto();
                        },
                        child: Text(
                          "Upload Formulir C1",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.015,
                              color: hitam,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: p1.maxWidth * 0.27, top: p1.maxHeight * 0.02),
                child: Container(
                  width: p1.maxWidth * 0.5,
                  height: p1.maxHeight * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: hitam.withOpacity(0.2),
                            offset: const Offset(3, 3))
                      ],
                      color: birumuda,
                      border: Border.all(color: colorbiru, width: 1.0)),
                  child: TextButton(
                      onPressed: () {
                        _tambahdata();
                        setState(() {});
                      },
                      child: Text(
                        "Simpan",
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            color: hitam,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
