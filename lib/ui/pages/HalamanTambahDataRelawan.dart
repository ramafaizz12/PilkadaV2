part of 'pages.dart';

class HalamanTambahDataRelawan extends StatefulWidget {
  const HalamanTambahDataRelawan({super.key});

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

  Future pickfoto() async {
    final myfile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 1);
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
                  ContainerInput(
                      nama: 'Nama Relawan',
                      control: namarelawancontrol,
                      hint: 'Masukkan Nama Relawan',
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.07)
                ],
              ),
              ContainerInput(
                  nama: 'No.KTP',
                  control: noktp,
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07,
                  tipekeyboard: TextInputType.number,
                  hint: 'Masukkan No KTP'),
              ContainerInput(
                  nama: 'No.HP',
                  control: nohpcontrol,
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerInput(
                      nama: 'Tempat Lahir',
                      control: tempatlahircontrol,
                      width: p1.maxWidth * 0.5,
                      height: p1.maxHeight * 0.07),
                  ContainerInput(
                      nama: 'Tanggal Lahir',
                      control: tanggalahircontrol,
                      width: p1.maxWidth * 0.5,
                      ontapfield: () async {
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
                      height: p1.maxHeight * 0.07)
                ],
              ),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  asyncitem: (value) => auth.getnamagruprelawan(nama: value),
                  nama: 'Grup Relawan',
                  oncanged: (value) {
                    setState(() {
                      selectedgrup = value;
                    });
                  },
                  selecitem: selectedgrup),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  nama: 'Jenis Kelamin',
                  oncanged: (value) {
                    setState(() {
                      selectedjkl = value;
                    });
                  },
                  items: itemjeniskelamin,
                  selecitem: selectedjkl),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  nama: 'Agama',
                  oncanged: (value) {
                    setState(() {
                      selectedagama = value;
                    });
                  },
                  items: itemagama,
                  selecitem: selectedagama),
              Containerdropdown(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.13,
                  nama: 'Provinsi',
                  selecitem: selectedprovinsi,
                  oncanged: (value) {
                    setState(() {
                      selectedprovinsi = value;
                    });
                  },
                  asyncitem: (value) => auth.getprovinsilist(provinsi: value)),
              Containerdropdown(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.13,
                nama: 'Kabupaten / Kota',
                selecitem: selectedkota,
                oncanged: (value) {
                  setState(() {
                    selectedkota = value;
                  });
                },
                asyncitem: (value) => auth.getkabupatenlist(
                    provinsi: selectedprovinsi.toString()),
              ),
              Container(
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
