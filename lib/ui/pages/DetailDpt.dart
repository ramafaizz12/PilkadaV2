part of 'pages.dart';

class HalamanDetailDPT extends StatefulWidget {
  String namadpt;
  String gambar;
  String kabupaten;
  String nik;
  String tempatlahir;
  String tanggallahir;
  String jkl;
  String agama;
  String nohp;
  String email;
  String provinsi;
  String kecamatan;

  HalamanDetailDPT(
      {this.namadpt = 'Relawan 001',
      this.kabupaten = 'Makassar',
      this.agama = '',
      this.email = '',
      this.jkl = '',
      this.kecamatan = '',
      this.tanggallahir = '',
      this.tempatlahir = '',
      this.nik = '',
      this.nohp = '',
      this.provinsi = '',
      this.gambar = ''});

  @override
  State<HalamanDetailDPT> createState() => _HalamanDetailDPTState();
}

class _HalamanDetailDPTState extends State<HalamanDetailDPT> {
  @override
  initState() {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Nama DPT\nNIK\nTempat Lahir\nTanggal Lahir\nJenis Kelamin\nAgama\nNo.HP\nEmail\nProvinsi\nKabupaten / Kota\nKecamatan",
                    style: textpoppin,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${widget.namadpt}\n${widget.nik}\n${widget.tempatlahir}\n${widget.tanggallahir}\n${widget.jkl}\n${widget.agama}\n${widget.nohp}\n${widget.email}\n${widget.provinsi}\n${widget.kabupaten}\n${widget.kecamatan}",
                      style: textpoppin.copyWith(fontWeight: FontWeight.w600),
                    ),
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
