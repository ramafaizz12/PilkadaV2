part of 'pages.dart';

class HalamanProfile extends StatefulWidget {
  String nama;
  String nik;
  String alamat;
  String namadaerah;
  String namapartai;

  HalamanProfile(
      {this.nama = '',
      this.nik = '',
      this.alamat = '',
      this.namadaerah = '',
      this.namapartai = ''});
  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  TextEditingController nikcontrol = TextEditingController();
  TextEditingController namacontrol = TextEditingController();
  TextEditingController alamatcontrol = TextEditingController();

  TextEditingController namadaerahcontrol = TextEditingController();

  TextEditingController namapartaicontrol = TextEditingController();

  @override
  initState() {
    nikcontrol.text = widget.nik;
    namacontrol.text = widget.nama;
    alamatcontrol.text = widget.alamat;
    namadaerahcontrol.text = widget.namadaerah;
    namapartaicontrol.text = widget.namapartai;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (p0, p1) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: putih, width: 8.0)),
                    width: p1.maxWidth * 0.3,
                    height: p1.maxHeight * 0.3,
                    child: BlocBuilder<DataprofileBloc, DataprofileState>(
                      builder: (context, state) {
                        return state is DataprofileLoaded
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${state.data!.foto}'))
                            : Text("");
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Lengkap",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Text(
                          "Nama Daerah",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Text(
                          "NIK",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                        Text(
                          "Alamat",
                          style: textpoppin.copyWith(
                              fontSize: p1.maxHeight * 0.02),
                        ),
                      ],
                    ),
                    BlocBuilder<DataprofileBloc, DataprofileState>(
                      builder: (context, state) {
                        return state is DataprofileLoaded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.data!.name}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                  Text(
                                    "${state.data!.asal}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                  Text(
                                    "${state.data!.nik}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                  Text(
                                    "${state.data!.alamat}",
                                    style: textpoppin.copyWith(
                                        fontSize: p1.maxHeight * 0.02),
                                  ),
                                ],
                              )
                            : SpinKitDualRing(
                                color: birumuda,
                              );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
              ],
            ));
  }
}
