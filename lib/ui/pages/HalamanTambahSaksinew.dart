part of 'pages.dart';

class HalamanTambahSaksiNew extends StatefulWidget {
  const HalamanTambahSaksiNew({super.key});

  @override
  State<HalamanTambahSaksiNew> createState() => _HalamanTambahSaksiNewState();
}

class _HalamanTambahSaksiNewState extends State<HalamanTambahSaksiNew> {
  File? _filefoto;

  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  List<DataProvinsi?> dataprovinsi = [];
  List<String> itemkecamatan = [];
  List<String> itemprovinsi = [];
  List<String> itemkabupaten = [];

  String? selectedkecamatan;
  String? selectedkota;
  String? selectedprovinsi;

  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _tambahdata() {
    context.read<DatasaksiBloc>().add(TambahDatasaksi(
          nama_saksi: namasaksicontrol.text,
          alamat: alamatcontrol.text,
          no_hp: nohpcontrol.text,
          role: rolecontrol.text,
          nik: noktp.text,
          password: passwordcontrol.text,
          email: emailcontrol.text,
          Province_id: dataprovinsi
              .firstWhere((e) => e!.name.toString() == selectedprovinsi)!
              .id
              .toString(),
          district_id: datakecamatan
              .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
              .id
              .toString(),
          tps_id: tpscontrol.text,
          saksi: _filefoto,
          regency_id: datakabupaten
              .firstWhere((e) => e!.name.toString() == selectedkota)!
              .id
              .toString(),
        ));
  }

  TextEditingController namasaksicontrol = TextEditingController();

  TextEditingController noktp = TextEditingController();

  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController tempatlahircontrol = TextEditingController();
  TextEditingController tanggalahircontrol = TextEditingController();
  TextEditingController rolecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController agamacontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();
  TextEditingController tpscontrol = TextEditingController();
  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController nohpcontrol = TextEditingController();

  @override
  initState() {
    super.initState();
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    tanggalahircontrol.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocBuilder<DatasaksiBloc, DatasaksiState>(
          builder: (context, state) {
            if (state is DatasaksiUpdate) {
              if (state.update == true) {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Data Berhasil Disimpan',
                    onConfirmBtnTap: () {
                      Navigator.pop(context);
                    },
                    confirmBtnColor: colorbiru,
                    confirmBtnTextStyle: textpoppin.copyWith(color: putih));
              }
              if (state.update == false) {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: 'Data Gagal Disimpan',
                    confirmBtnColor: colorbiru,
                    confirmBtnTextStyle: textpoppin);
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        pickfoto();
                      },
                      child: Container(
                          width: p1.maxWidth * 0.25,
                          height: p1.maxHeight * 0.25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: putih),
                          child: LayoutBuilder(
                            builder: (p0, p2) => (_filefoto != null)
                                ? Image.file(_filefoto!)
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,
                                          color: pinkabu,
                                          size: p2.maxWidth * 0.5),
                                      Text("Tambah Foto",
                                          style: textpoppin.copyWith(
                                              color: pinkabu,
                                              fontWeight: FontWeight.w600,
                                              fontSize: p2.maxHeight * 0.05))
                                    ],
                                  ),
                          )),
                    ),
                  ),
                  Container(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.05,
                    decoration: BoxDecoration(
                        color: putih,
                        border: Border.all(width: 1.0, color: hitam),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: namasaksicontrol,
                      maxLines: 1,
                      onTap: () {
                        setState(() {
                          var data = dataprovinsi
                              .map((e) => e!.name.toString())
                              .toList();
                          itemprovinsi = data;
                        });
                      },
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Saksi',
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
                    'Alamat',
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
                      controller: alamatcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Alamat',
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
                    'No.KTP',
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
                      controller: noktp,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan No.Ktp',
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
                        'Email',
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Container(
                        width: p1.maxWidth * 0.45,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                            color: putih,
                            border: Border.all(width: 1.0, color: hitam),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          controller: emailcontrol,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Email',
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
                        'No.HP',
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Container(
                        width: p1.maxWidth * 0.45,
                        height: p1.maxHeight * 0.05,
                        decoration: BoxDecoration(
                            color: putih,
                            border: Border.all(width: 1.0, color: hitam),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: nohpcontrol,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan No.Hp',
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Role',
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
                      controller: rolecontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Role',
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
                    'Password',
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
                      controller: passwordcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Password',
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
                    'TPS',
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
                      controller: tpscontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Tps',
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
