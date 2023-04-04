part of 'pages.dart';

class HalamanDetailKoordinator extends StatefulWidget {
  String koordinator;
  String noktp;
  String email;
  String notelepon;
  String alamat;
  String foto;
  String agama;
  String provinsi;
  String gruprelawan;
  String kabupaten;

  HalamanDetailKoordinator(
      {super.key, this.koordinator = 'Koordinator 1',
      this.noktp = '12345678',
      this.email = 'email23@gmail.com',
      this.notelepon = '081241782869',
      this.agama = 'islam',
      this.provinsi = 'Sulawesi Selatan',
      this.alamat = 'Makassar',
      this.gruprelawan = 'Group 1',
      this.kabupaten = 'Makassar',
      this.foto = ''});

  @override
  State<HalamanDetailKoordinator> createState() =>
      _HalamanDetailKoordinatorState();
}

class _HalamanDetailKoordinatorState extends State<HalamanDetailKoordinator> {
  @override
  void initState() {
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
                    'https://web-pilkada.taekwondosulsel.info/public/storage/${widget.foto}'),
              ),
              SizedBox(
                height: p1.maxHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Nama Koordinator\nNo.KTP\nEmail\nNo.Telepon\nAlamat\nAgama\nGrup Relawan\nProvinsi\nKabupaten/Kota",
                    style: textpoppin,
                  ),
                  Flexible(
                      flex: 1,
                      child: Text(
                        "${widget.koordinator}\n${widget.noktp}\n${widget.email}\n${widget.notelepon}\n${widget.alamat}\n${widget.agama}\n${widget.gruprelawan}\n${widget.provinsi}\n${widget.kabupaten}",
                        style: textpoppin.copyWith(fontWeight: FontWeight.w600),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
