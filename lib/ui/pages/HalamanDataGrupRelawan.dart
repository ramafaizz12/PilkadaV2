part of 'pages.dart';

class HalamanDataGruprelawan extends StatefulWidget {
  String namagruprelawan;
  String alamat;
  String email;

  HalamanDataGruprelawan(
      {this.namagruprelawan = 'Group 1',
      this.alamat = 'Makassar',
      this.email = 'email23@gmail.com'});

  @override
  State<HalamanDataGruprelawan> createState() => _HalamanDataGruprelawanState();
}

class _HalamanDataGruprelawanState extends State<HalamanDataGruprelawan> {
  int page = 4 + 1;
  @override
  initState() {
    context.read<DatarelawanBloc>().add(GrupRelawanConnect());
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
                hinttext: 'Cari Nama Grup Relawan',
                cari: (value) => context
                    .read<DatarelawanBloc>()
                    .add(DataGrupRelawanSearch(value: value)),
              ),
            ],
          ),
          SizedBox(height: p1.maxHeight * 0.04),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.8,
              child: BlocBuilder<DatarelawanBloc, DatarelawanState>(
                builder: (context, state) {
                  return state is DataGruprelawanLoaded
                      ? state.data!.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: (1 / .4),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: p1.maxHeight * 0.02,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) => Animate(
                                effects: [
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
                                      border: Border.all(
                                          color: hitam.withOpacity(0.5),
                                          width: 1.0),
                                      color: pinkabu,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: LayoutBuilder(
                                    builder: (p0, p2) => Padding(
                                      padding: EdgeInsets.only(
                                          top: p1.maxHeight * 0.02,
                                          left: p1.maxHeight * 0.02,
                                          right: p1.maxHeight * 0.02),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${state.data![index].nama_grup}',
                                                style: textpoppin.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        p2.maxHeight * 0.12)),
                                            Row(children: [
                                              Container(
                                                  width: p2.maxWidth * 0.05,
                                                  height: p2.maxHeight * 0.05,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: abuabu)),
                                              Text(
                                                  "${state.data![index].email}",
                                                  style: textpoppin.copyWith(
                                                      color: hitam,
                                                      fontSize:
                                                          p2.maxHeight * 0.07))
                                            ]),
                                            Text(
                                                "${state.data![index].alamat_posko}",
                                                style: textpoppin.copyWith(
                                                    color: hitam,
                                                    fontSize:
                                                        p2.maxHeight * 0.07)),
                                          ]),
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
    );
  }
}
