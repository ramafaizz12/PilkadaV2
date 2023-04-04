part of 'pages.dart';

class HalamanDetailRelawan extends StatefulWidget {
  String relawan;
  String noktp;

  String notelepon;
  String tempatlahir;
  String tanggallahir;
  String agama;
  String jeniskelamin;
  String gruprelawan;
  String kabupaten;
  String? gambar;

  HalamanDetailRelawan({super.key, 
    this.relawan = 'Relawan 001',
    this.noktp = '12345678',
    this.notelepon = '081241782869',
    this.tempatlahir = 'Makassar',
    this.tanggallahir = '121201',
    this.agama = 'islam',
    this.gambar,
    this.jeniskelamin = 'Laki - Laki',
    this.gruprelawan = 'Group 1',
    this.kabupaten = 'Makassar',
  });

  @override
  State<HalamanDetailRelawan> createState() => _HalamanDetailRelawanState();
}

class _HalamanDetailRelawanState extends State<HalamanDetailRelawan> {
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
            height: p1.maxHeight * 0.04,
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
                    "Nama Relawan\nNo.KTP\nNo.Telepon\nTempat Lahir\nTanggal Lahir\nAgama\nJenis Kelamin\nGrup Relawan\nKabupaten/Kota",
                    style: textpoppin,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${widget.relawan}\n${widget.noktp}\n${widget.notelepon}\n${widget.tempatlahir}\n${widget.tanggallahir}\n${widget.agama}\n${widget.jeniskelamin}\n${widget.gruprelawan}\n${widget.kabupaten}",
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
