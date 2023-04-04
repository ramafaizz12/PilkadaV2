part of 'pages.dart';

class HalamanDataTps extends StatefulWidget {
  String tps;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String keterangan;

  HalamanDataTps(
      {super.key, this.tps = '001',
      this.provinsi = 'Sulawesi Selatan',
      this.kabupaten = 'Makassar',
      this.kecamatan = 'Tamalanrea',
      this.keterangan = '-'});

  @override
  State<HalamanDataTps> createState() => _HalamanDataTpsState();
}

class _HalamanDataTpsState extends State<HalamanDataTps> {
  Authentication auth = Authentication();

  List<DataProvinsi?> dataprovinsi = [];
  List<DataKabupaten?> datakabupaten = [];
  List<DataKecamatan?> datakecamatan = [];

  List<String> kota = [];
  List<String> itemtps = [];
  int page = 4 + 1;

  String? selectedprovinsi;
  String? selectedtps;
  String? selectedkecamatan;
  String? selectedkota;
  @override
  void initState() {
    auth.getdatakabupaten().then((value) => datakabupaten = value!);
    auth.getdataprovinsi().then((value) => dataprovinsi = value!);
    auth.getdatakecamatan().then((value) => datakecamatan = value!);
    context.read<DatatpsBloc>().add(Datatpsconnect(page: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<String>(
              selectedItem: selectedtps,
              asyncItems: (String? filter) =>
                  auth.getprovinsilist(provinsi: selectedprovinsi.toString()),
              onChanged: (value) {
                setState(() {
                  selectedtps = value;
                  var baru = dataprovinsi
                      .firstWhere((e) => e!.name.toString() == selectedtps)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchProvinsi(provinsi: baru.toString()));
                });
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Provinsi',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(
              height: p1.maxHeight * 0.02,
            ),
            DropdownSearch<String>(
              selectedItem: selectedkota,
              onChanged: (value) {
                setState(() {
                  selectedkota = value;
                  var baru = datakabupaten
                      .firstWhere((e) => e!.name.toString() == selectedkota)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchKabupaten(kabupaten: baru.toString()));
                });
              },
              asyncItems: (String? filter) =>
                  auth.getkabupatenlist(provinsi: selectedtps.toString()),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Kabupaten / Kota',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(
              height: p1.maxHeight * 0.02,
            ),
            DropdownSearch<String>(
              selectedItem: selectedkecamatan,
              onChanged: (value) {
                setState(() {
                  selectedkecamatan = value;
                  var baru = datakecamatan
                      .firstWhere(
                          (e) => e!.name.toString() == selectedkecamatan)!
                      .id
                      .toString();
                  context
                      .read<DatatpsBloc>()
                      .add(DatatpsSearchKecamatan(kecamatan: baru.toString()));
                });
              },
              asyncItems: (String? filter) =>
                  auth.getkecamatanlist(provinsi: selectedkota.toString()),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: 'Pilih Kecamatan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(height: p1.maxHeight * 0.04),
            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.55,
                child: BlocBuilder<DatatpsBloc, DatatpsState>(
                  builder: (context, state) {
                    return state is DatatpsLoaded
                        ? state.data!.isNotEmpty
                            ? GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.data!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (1 / .5),
                                        crossAxisCount: 1,
                                        mainAxisSpacing: p1.maxHeight * 0.02,
                                        crossAxisSpacing: 5),
                                itemBuilder: (context, index) => Animate(
                                  effects: const [
                                    FadeEffect(duration: Duration(seconds: 2)),
                                    ScaleEffect(duration: Duration(seconds: 1))
                                  ],
                                  child: Container(
                                    width: p1.maxWidth,
                                    height: p1.maxHeight * 0.2,
                                    decoration: BoxDecoration(
                                        color: abuabu,
                                        borderRadius: BorderRadius.circular(17),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 0.5,
                                              blurRadius: 5,
                                              offset: const Offset(2, 4))
                                        ]),
                                    child: LayoutBuilder(
                                      builder: (p0, p2) => Row(
                                        children: [
                                          SizedBox(
                                              width: p2.maxWidth * 0.4,
                                              height: p2.maxHeight,
                                              child: Image.network(
                                                  'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].image}',
                                                  fit: BoxFit.fill)),
                                          SizedBox(width: p2.maxWidth * 0.05),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${state.data![index].tps}',
                                                    style: textpoppin.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: p2.maxHeight *
                                                            0.12)),
                                                Row(children: [
                                                  Container(
                                                      width: p2.maxWidth * 0.05,
                                                      height:
                                                          p2.maxHeight * 0.05,
                                                      decoration: const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: pinkabu)),
                                                  Text(
                                                      state.provinsi![index],
                                                      style:
                                                          textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.05))
                                                ]),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                          state.kabupaten![index],
                                                          style: textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.05)),
                                                      SizedBox(
                                                          width: p2.maxWidth *
                                                              0.05),
                                                      Text(
                                                          state.kecamatan![index],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: textpoppin
                                                              .copyWith(
                                                                  color: hitam,
                                                                  fontSize:
                                                                      p2.maxHeight *
                                                                          0.05))
                                                    ]),
                                                Text(
                                                    "${state.data![index].alamat}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textpoppin.copyWith(
                                                        color: hitam,
                                                        fontSize: p2.maxHeight *
                                                            0.05)),
                                                Flexible(
                                                  flex: 1,
                                                  child: Text(
                                                      maxLines: 3,
                                                      "${state.data![index].ket}"
                                                          .replaceAll(
                                                              RegExp(
                                                                  "<p>|</p>|<br>"),
                                                              ""),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          textpoppin.copyWith(
                                                              color: hitam,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.05)),
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                "Data Tidak Ditemukan",
                                style: textpoppin.copyWith(
                                    fontSize: p1.maxWidth * 0.04),
                              ))
                        : const SpinKitDualRing(
                            color: birumuda,
                          );
                  },
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: p1.maxHeight * 0.02),
                width: p1.maxWidth * 0.7,
                height: p1.maxHeight * 0.06,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: hitam.withOpacity(0.2), offset: const Offset(3, 3))
                ], color: birumuda, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '1'));
                        },
                        child:
                            Text("1", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '2'));
                        },
                        child:
                            Text("2", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '3'));
                        },
                        child:
                            Text("3", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: '4'));
                        },
                        child:
                            Text("4", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<DatatpsBloc>()
                              .add(Datatpsconnect(page: page.toString()));
                        },
                        child:
                            Text(">", style: textpoppin.copyWith(color: putih)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
