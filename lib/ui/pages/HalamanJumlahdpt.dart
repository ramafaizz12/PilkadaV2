part of 'pages.dart';

class HalamanJumlahdpt extends StatefulWidget {
  @override
  State<HalamanJumlahdpt> createState() => _HalamanJumlahdptState();
}

class _HalamanJumlahdptState extends State<HalamanJumlahdpt> {
  Authentication auth = Authentication();
  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];
  String? selectedkota;
  String? selectedprovinsi;
  String? selectedkecamatan;

  @override
  initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    context.read<DatadptBloc>().add(Datadptconnect());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          DropdownSearch<String>(
            selectedItem: selectedprovinsi,
            asyncItems: (String? filter) =>
                auth.getprovinsilist(provinsi: selectedprovinsi.toString()),
            onChanged: (value) {
              setState(() {
                selectedprovinsi = value;
                var baru = dataprovinsi
                    .firstWhere((e) => e!.name.toString() == selectedprovinsi)!
                    .id
                    .toString();
                context
                    .read<DatadptBloc>()
                    .add(DatadptSearchProvinsi(value: baru.toString()));
              });
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                dropdownSearchDecoration: InputDecoration(
                    hintText: 'Pilih Provinsi',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          SizedBox(height: p1.maxHeight * 0.02),
          DropdownSearch<String>(
            selectedItem: selectedkota,
            asyncItems: (String? filter) =>
                auth.getkabupatenlist(provinsi: selectedprovinsi.toString()),
            onChanged: (value) {
              setState(() {
                selectedkota = value;
                var baru = datakabupaten
                    .firstWhere((e) => e!.name.toString() == selectedkota)!
                    .id
                    .toString();
                context
                    .read<DatadptBloc>()
                    .add(DatadptSearchKabupaten(value: baru.toString()));
              });
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                dropdownSearchDecoration: InputDecoration(
                    hintText: 'Pilih Kabupaten / Kota',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          SizedBox(height: p1.maxHeight * 0.02),
          DropdownSearch<String>(
            selectedItem: selectedkecamatan,
            asyncItems: (String? filter) =>
                auth.getkecamatanlist(provinsi: selectedkota.toString()),
            onChanged: (value) {
              setState(() {
                selectedkecamatan = value;
                var baru = dataprovinsi
                    .firstWhere((e) => e!.name.toString() == selectedkecamatan)!
                    .id
                    .toString();
                context
                    .read<DatadptBloc>()
                    .add(DatadptSearchKecamatan(value: baru.toString()));
              });
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                dropdownSearchDecoration: InputDecoration(
                    hintText: 'Pilih Kecamatan',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          ContainerSearch(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.06,
            hinttext: 'Masukkan Nama DPT',
            cari: (value) => context
                .read<DatadptBloc>()
                .add(DatadptSearchnama(value: value)),
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.54,
              child: BlocBuilder<DatadptBloc, DatadptState>(
                builder: (context, state) {
                  return state is DatadptLoaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (1 / .9),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: p1.maxHeight * 0.02,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) => Animate(
                                    effects: [
                                      FadeEffect(
                                          duration: Duration(seconds: 2)),
                                      ScaleEffect(
                                          duration: Duration(seconds: 1))
                                    ],
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HalamanTemplateBaru(
                                                      nama: 'Detail DPT',
                                                      halamandata: HalamanDetailDPT(
                                                          namadpt:
                                                              '${state.data![index].nama}',
                                                          kabupaten:
                                                              '${state.datakabupaten![index]}',
                                                          agama:
                                                              '${state.data![index].agama}',
                                                          email:
                                                              '${state.data![index].email}',
                                                          jkl:
                                                              '${state.data![index].jkl}',
                                                          kecamatan:
                                                              '${state.datakecamatan![index]}',
                                                          tanggallahir:
                                                              '${state.data![index].tanggal_lahir}',
                                                          tempatlahir:
                                                              '${state.data![index].tempat_lahir}',
                                                          nik:
                                                              '${state.data![index].nik}',
                                                          nohp:
                                                              '${state.data![index].no_hp}',
                                                          provinsi:
                                                              '${state.dataprovinsi![index]}',
                                                          gambar:
                                                              '${state.data![index].foto}'),
                                                    )));
                                      },
                                      child: Container(
                                        width: p1.maxWidth,
                                        height: p1.maxHeight * 0.2,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  spreadRadius: 0.5,
                                                  blurRadius: 5,
                                                  offset: const Offset(2, 4))
                                            ],
                                            color: abuabu,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 70,
                                              backgroundImage: NetworkImage(
                                                  'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}'),
                                            ),
                                            SizedBox(
                                                height: p1.maxHeight * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Nama DPT\nKabupaten/Kota\nProvinsi\nKecamatan",
                                                  style: textpoppin.copyWith(
                                                      fontSize:
                                                          p1.maxHeight * 0.02),
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: Text(
                                                    "${state.data![index].nama}\n${state.datakabupaten![index]}\n${state.dataprovinsi![index]}\n${state.datakecamatan![index]}",
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textpoppin.copyWith(
                                                        fontSize:
                                                            p1.maxHeight * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                          : Center(
                              child: Text(
                              "Data Tidak Ditemukan",
                              style: textpoppin.copyWith(
                                  fontSize: p1.maxWidth * 0.04),
                            ))
                      : SpinKitDualRing(
                          color: birumuda,
                        );
                },
              ))
        ],
      ),
    );
  }
}
