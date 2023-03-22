part of 'pages.dart';

class HalamanDatarelawancoba extends StatefulWidget {
  String gambar;
  String namarelawan;
  String gruprelawan;

  HalamanDatarelawancoba(
      {this.namarelawan = 'Relawan 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanDatarelawancoba> createState() => _HalamanDatarelawancobaState();
}

class _HalamanDatarelawancobaState extends State<HalamanDatarelawancoba> {
  int page = 4 + 1;
  @override
  initState() {
    context.read<DatarelawanBloc>().add(DataRelawanConnect(page: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContainerSearch(
                width: p1.maxWidth * 0.81,
                height: p1.maxHeight * 0.07,
                hinttext: 'Cari Nama Relawan',
                cari: (value) => context
                    .read<DatarelawanBloc>()
                    .add(DatarelawanSearch(value: value)),
              ),
              BlocBuilder<DataprofileBloc, DataprofileState>(
                builder: (context, state) {
                  if (state is DataprofileLoaded) {
                    if (state.data!.role == 'admin') {
                      return Text("");
                    }
                  }
                  return ContainerTambah(
                    width: p1.maxWidth * 0.15,
                    height: p1.maxHeight * 0.07,
                    fungsi: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanTemplateBaru(
                                    nama: 'Tambah Relawan',
                                    halamandata: HalamanTambahDataRelawan(),
                                  )));
                    },
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.75,
              child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
                builder: (context, state) {
                  return state is DataRelawanLoaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (1 / .22),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: p1.maxHeight * 0.02,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) => Animate(
                                    effects: [
                                      FadeEffect(
                                          duration: Duration(seconds: 1)),
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
                                                      nama: 'Detail Relawan',
                                                      halamandata: HalamanDetailRelawan(
                                                          relawan:
                                                              '${state.data![index].nama}',
                                                          noktp:
                                                              '${state.data![index].nik}',
                                                          notelepon:
                                                              '${state.data![index].no_hp}',
                                                          tempatlahir:
                                                              '${state.data![index].tempat_lahir}',
                                                          tanggallahir:
                                                              '${state.data![index].tanggal_lahir}',
                                                          agama:
                                                              '${state.data![index].agama}',
                                                          gambar:
                                                              '${state.data![index].foto}',
                                                          jeniskelamin:
                                                              '${state.data![index].jkl}',
                                                          gruprelawan:
                                                              '${state.gruprelawan![index]}',
                                                          kabupaten:
                                                              '${state.datakabupaten![index]}'),
                                                    )));
                                      },
                                      child: Container(
                                        width: p1.maxWidth,
                                        height: p1.maxHeight * 0.2,
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
                                                BorderRadius.circular(25)),
                                        child: LayoutBuilder(
                                          builder: (p0, p2) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}'),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                      "${state.data![index].nama}",
                                                      style:
                                                          textpoppin.copyWith(
                                                              color: hitam,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  p2.maxHeight *
                                                                      0.2)),
                                                  Row(children: [
                                                    Container(
                                                        width:
                                                            p2.maxWidth * 0.1,
                                                        height:
                                                            p2.maxHeight * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    pinkabu)),
                                                    Text(
                                                        "${state.gruprelawan![index]}",
                                                        style:
                                                            textpoppin.copyWith(
                                                                color: hitam,
                                                                fontSize:
                                                                    p2.maxHeight *
                                                                        0.15))
                                                  ]),
                                                ],
                                              ),
                                            ],
                                          ),
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
              )),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: p1.maxHeight * 0.02),
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.06,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: hitam.withOpacity(0.2), offset: Offset(3, 3))
              ], color: birumuda, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '1'));
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
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '2'));
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
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '3'));
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
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: '4'));
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
                            .read<DatarelawanBloc>()
                            .add(DataRelawanConnect(page: page.toString()));
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
    );
  }
}
