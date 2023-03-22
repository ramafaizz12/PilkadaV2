part of 'pages.dart';

class HalamanTambahDataRelawan extends StatefulWidget {
  @override
  State<HalamanTambahDataRelawan> createState() =>
      _HalamanTambahDataRelawanState();
}

class _HalamanTambahDataRelawanState extends State<HalamanTambahDataRelawan> {
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
  String? selectedjkl;
  String? selectedagama;
  String? selectedgrup;
  int? id;
  NIKModel? nikResult;

  ///Validate NIK informations

  Future pickfoto() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _filefoto = File(myfile!.path);
    });
  }

  _tambahdata() {
    context.read<DatarelawanBloc>().add(TambahDataRelawan(
        nama: namarelawancontrol.text,
        nik: noktp.text,
        tempat_lahir: tempatlahircontrol.text,
        tanggal_lahir: tanggalahircontrol.text,
        agama: selectedagama,
        // kordinator_id: id,
        jkl: selectedjkl,
        foto: _filefoto,
        scan_ktp: File(pictureFile!.path),
        gruprelawan_id: datagruprelawan
            .firstWhere((e) => e.nama_grup.toString() == selectedgrup)
            .id
            .toString(),
        regency_id: datakabupaten
            .firstWhere((e) => e!.name.toString() == selectedkota)!
            .id
            .toString(),
        no_hp: nohpcontrol.text,
        Province_id: dataprovinsi
            .firstWhere((e) => e!.name.toString() == selectedprovinsi)!
            .id
            .toString()));
  }

  TextEditingController namarelawancontrol = TextEditingController();

  TextEditingController noktp = TextEditingController();

  TextEditingController alamatcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController tempatlahircontrol = TextEditingController();
  TextEditingController tanggalahircontrol = TextEditingController();

  TextEditingController agamacontrol = TextEditingController();
  TextEditingController jeniskelamincontrol = TextEditingController();
  TextEditingController gruprelawancontrol = TextEditingController();
  TextEditingController kabupatencontrol = TextEditingController();
  TextEditingController provinsicontrol = TextEditingController();
  TextEditingController nohpcontrol = TextEditingController();
  void validate() async {
    if (noktp.text.isNotEmpty) {
      NIKModel result = await NIKValidator.instance.parse(nik: noktp.text);

      ///use result.valid to check if the nik is valid
      setState(() {
        nikResult = result;
      });
    }
  }

  @override
  initState() {
    super.initState();
    var state = context.read<DataprofileBloc>().state;
    if (state is DataprofileLoaded) {
      id = state.data!.id;
    }
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatagruprelawan().then((value) => datagruprelawan = value!);

    tanggalahircontrol.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Stack(children: [
        BlocBuilder<DatarelawanBloc, DatarelawanState>(
          builder: (context, state) {
            if (state is DataRelawanUpdate) {
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

            return SizedBox();
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
                          decoration: BoxDecoration(
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
                  Text(
                    'Nama Relawan',
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
                      keyboardType: TextInputType.name,
                      controller: namarelawancontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan Nama Relawan',
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
                    'No KTP',
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
                          hintText: 'Masukkan No.KTP',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 5, left: 5)),
                    ),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: p1.maxWidth * 0.4,
                  height: p1.maxHeight * 0.05,
                  margin: EdgeInsets.only(
                      top: p1.maxHeight * 0.02, bottom: p1.maxHeight * 0.02),
                  decoration: BoxDecoration(
                      color: birumuda,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: hitam.withOpacity(0.2), offset: Offset(3, 3))
                      ]),
                  child: TextButton(
                      onPressed: () {
                        validate();
                      },
                      child: Text(
                        "Validasi NIK",
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.016,
                            color: hitam,
                            fontWeight: FontWeight.w600),
                      )),
                ),
                nikResult != null && nikResult!.valid == false
                    ? Text(
                        "nik gagal",
                        style: textpoppin.copyWith(
                            fontWeight: FontWeight.w600, color: colororange),
                      )
                    : Text(
                        'nik berhasil',
                        style: textpoppin.copyWith(
                            fontWeight: FontWeight.w600, color: colororange),
                      ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No.HP',
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
                      controller: nohpcontrol,
                      maxLines: 1,
                      style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      decoration: const InputDecoration(
                          hintText: 'Masukkan No.Hp',
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
                        'Tempat Lahir',
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
                          keyboardType: TextInputType.name,
                          controller: tempatlahircontrol,
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Tempat Lahir',
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
                        'Tanggal Lahir',
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
                          keyboardType: TextInputType.datetime,
                          controller: tanggalahircontrol,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                tanggalahircontrol.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          maxLines: 1,
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                          decoration: const InputDecoration(
                              hintText: 'Masukkan Tanggal Lahir',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grup Relawan',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedgrup,
                    asyncItems: (String? filter) => auth.getnamagruprelawan(
                        nama: selectedprovinsi.toString()),
                    onChanged: (value) {
                      setState(() {
                        selectedgrup = value;
                      });
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Grup Relawan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Kelamin',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedjkl,
                    onChanged: (value) {
                      setState(() {
                        selectedjkl = value;
                      });
                    },
                    items: itemjeniskelamin,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Jenis Kelamin',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Agama',
                    style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  ),
                  DropdownSearch<String>(
                    selectedItem: selectedagama,
                    onChanged: (value) {
                      setState(() {
                        selectedagama = value;
                      });
                    },
                    items: itemagama,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            textpoppin.copyWith(fontWeight: FontWeight.w600),
                        dropdownSearchDecoration: InputDecoration(
                            hintText: 'Pilih Agama',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  )
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
              SizedBox(
                height: p1.maxHeight * 0.02,
              ),
              Container(
                width: p1.maxWidth * 0.4,
                height: p1.maxHeight * 0.05,
                decoration: BoxDecoration(
                    color: birumuda,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: hitam.withOpacity(0.2), offset: Offset(3, 3))
                    ]),
                child: TextButton(
                    onPressed: () async {
                      pictureFile = await availableCameras().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraPage(
                              cameras: value,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "SCAN KTP",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.016,
                          color: hitam,
                          fontWeight: FontWeight.w600),
                    )),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
