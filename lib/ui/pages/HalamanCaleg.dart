part of 'pages.dart';

class HalamanCaleg extends StatefulWidget {
  const HalamanCaleg({super.key});

  @override
  State<HalamanCaleg> createState() => _HalamanCalegState();
}

class _HalamanCalegState extends State<HalamanCaleg> {
  int page = 4 + 1;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatakandidatBloc>().add(DataKandidatConnect());

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
                hinttext: 'Cari Data Caleg',
                cari: (value) => context
                    .read<DatakandidatBloc>()
                    .add(DataKandidatSearch(value: value)),
              ),
              // ContainerTambah(
              //   width: p1.maxWidth * 0.15,
              //   height: p1.maxHeight * 0.07,
              //   fungsi: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HalamanTemplateBaru(
              //                   nama: 'Tambah Caleg',
              //                   halamandata: HalamanTambahDatacaleg(),
              //                 )));
              //   },
              // )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.8,
              child: BlocBuilder<DatakandidatBloc, DatakandidatState>(
                builder: (context, state) {
                  return state is DataKandidatLoaded
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
                                effects: const [
                                  FadeEffect(duration: Duration(seconds: 2)),
                                  ScaleEffect(duration: Duration(seconds: 1))
                                ],
                                child: Container(
                                  width: p1.maxWidth,
                                  height: p1.maxHeight * 0.2,
                                  margin: const EdgeInsets.all(10),
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
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: p1.maxWidth * 0.94,
                                        height: p1.maxHeight * 0.2,
                                        child: Image.network(
                                          'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data![index].foto}',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "No.Kandidat\nNama Kandidat\nNama Wakil\nVisi Misi\nProgram",
                                            style: textpoppin.copyWith(
                                                fontSize: p1.maxHeight * 0.02),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Text(
                                              "${state.data![index].no_kandidat}\n${state.data![index].nama_kandidat}\n${state.data![index].nama_wakil}\n${state.data![index].visi_misi}\n${state.data![index].program}",
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: textpoppin.copyWith(
                                                  fontSize: p1.maxHeight * 0.02,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
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
                            .read<DatakandidatBloc>()
                            .add(DataKandidatConnect(page: '1'));
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
                            .read<DatakandidatBloc>()
                            .add(DataKandidatConnect(page: '2'));
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
                            .read<DatakandidatBloc>()
                            .add(DataKandidatConnect(page: '3'));
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
                            .read<DatakandidatBloc>()
                            .add(DataKandidatConnect(page: '4'));
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
                            .read<DatakandidatBloc>()
                            .add(DataKandidatConnect(page: page.toString()));
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
