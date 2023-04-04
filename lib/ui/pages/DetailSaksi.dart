part of 'pages.dart';

class HalamanDetailSaksi extends StatefulWidget {
  String namasaksi;
  String alamat;
  String email;
  String notelepon;

  String kabupaten;
  String kecamatan;
  String? gambar;
  String tps;
  HalamanDetailSaksi(
      {super.key, this.namasaksi = 'Saksi 001',
      this.alamat = 'Makassar',
      this.email = 'email23@gmail.com',
      this.notelepon = '081241782869',
      this.kabupaten = 'Makassar',
      this.kecamatan = 'Tamalanrea',
      this.gambar,
      this.tps = '001'});

  @override
  State<HalamanDetailSaksi> createState() => _HalamanDetailSaksiState();
}

class _HalamanDetailSaksiState extends State<HalamanDetailSaksi> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder<List<DataKabupaten>?>(
    //   future: Authentication.getdatakabupaten(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       var item = snapshot.data!
    //           .firstWhere((e) => e.id == int.parse(widget.kabupaten));
    //       setState(() {
    //         kabupatenbaru = item.name.toString();
    //       });
    //     }
    //     return Text("no data");
    //   },
    // );

    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${widget.gambar}'),
              ),
              SizedBox(
                height: p1.maxHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Nama Saksi",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Alamat",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "No Telepon",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Email",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Kabupaten/Kota",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "Kecamatan",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                      Text(
                        "TPS",
                        style:
                            textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.namasaksi,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.alamat,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.notelepon,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.email,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.kabupaten,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.kecamatan,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.tps,
                        style: textpoppin.copyWith(
                            fontSize: p1.maxHeight * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
