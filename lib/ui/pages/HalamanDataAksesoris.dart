part of 'pages.dart';

class HalamanAksesoris extends StatefulWidget {
  String nama;
  String alamat;
  String ket;

  HalamanAksesoris(
      {super.key, this.nama = 'Nama 1', this.alamat = 'Makassar', this.ket = '-'});

  @override
  State<HalamanAksesoris> createState() => _HalamanAksesorisState();
}

class _HalamanAksesorisState extends State<HalamanAksesoris> {
  @override
  initState() {
    context.read<DataaksesorisBloc>().add(DataaksesorisConnect());

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
          ContainerSearch(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.07,
            hinttext: 'Cari Nama Penerima',
            cari: (value) => context
                .read<DataaksesorisBloc>()
                .add(DataaksesorisSearch(value: value)),
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.85,
              child: BlocBuilder<DataaksesorisBloc, DataaksesorisState>(
                builder: (context, state) {
                  return state is Dataaksesorisloaded
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
                                        Text("${state.data![index].nama}",
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
                                          Text("${state.data![index].alamat}",
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
                                          Text(
                                              "${state.data![index].keterangan}",
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
              ))
        ],
      ),
    );
  }
}
