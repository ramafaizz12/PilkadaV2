part of 'pages.dart';

class HalamanKordinatorKomunitas extends StatefulWidget {
  String gambar;
  String nama;
  String gruprelawan;

  HalamanKordinatorKomunitas(
      {super.key, this.nama = 'Koordinator 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanKordinatorKomunitas> createState() =>
      _HalamanKordinatorKomunitasState();
}

class _HalamanKordinatorKomunitasState
    extends State<HalamanKordinatorKomunitas> {
  int page = 4 + 1;
  @override
  initState() {
    context.read<DatakoordinatorBloc>().add(DataKoordinatorConnectKomunitas());
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
                width: p1.maxWidth,
                height: p1.maxHeight * 0.07,
                hinttext: 'Cari Nama Koordinator',
              ),
              // ContainerTambah(
              //   width: p1.maxWidth * 0.15,
              //   height: p1.maxHeight * 0.07,
              //   fungsi: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HalamanTemplateBaru(
              //                   nama: 'Tambah Koordinator',
              //                   halamandata: HalamanTambahDataKoordinator(),
              //                 )));
              //   },
              // )
            ],
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.82,
              child: BlocBuilder<DatakoordinatorBloc, DatakoordinatorState>(
                builder: (context, state) {
                  return state is DataKoordinatorKomunitas
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
                                effects: const [
                                  FadeEffect(duration: Duration(seconds: 2)),
                                  ScaleEffect(duration: Duration(seconds: 1))
                                ],
                                child: Container(
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.2,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 5,
                                            offset: const Offset(2, 4))
                                      ],
                                      color: abuabu,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: LayoutBuilder(
                                    builder: (p0, p2) => Column(
                                      children: [
                                        Text(
                                            "${state.data![index].nama_komunitas}",
                                            style: textpoppin.copyWith(
                                                color: hitam,
                                                fontWeight: FontWeight.w600,
                                                fontSize: p2.maxHeight * 0.2)),
                                        Row(children: [
                                          Container(
                                              width: p2.maxWidth * 0.1,
                                              height: p2.maxHeight * 0.1,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: pinkabu)),
                                          Text(
                                              "${state.data![index].alamat_komunitas}",
                                              style: textpoppin.copyWith(
                                                  color: hitam,
                                                  fontSize:
                                                      p2.maxHeight * 0.15))
                                        ]),
                                        Row(children: [
                                          Container(
                                              width: p2.maxWidth * 0.1,
                                              height: p2.maxHeight * 0.1,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: pinkabu)),
                                          Text("${state.data![index].email}",
                                              style: textpoppin.copyWith(
                                                  color: hitam,
                                                  fontSize:
                                                      p2.maxHeight * 0.15))
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnectKomunitas(page: '1'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnectKomunitas(page: '2'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnectKomunitas(page: '3'));
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
                            .read<DatakoordinatorBloc>()
                            .add(DataKoordinatorConnectKomunitas(page: '4'));
                      },
                      child:
                          Text("4", style: textpoppin.copyWith(color: putih)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context.read<DatakoordinatorBloc>().add(
                            DataKoordinatorConnectKomunitas(
                                page: page.toString()));
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
