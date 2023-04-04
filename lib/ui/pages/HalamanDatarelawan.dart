part of 'pages.dart';

class HalamanDataRelawan extends StatefulWidget {
  String gambar;
  String namarelawan;
  String gruprelawan;

  HalamanDataRelawan(
      {super.key, this.namarelawan = 'Relawan 1',
      this.gruprelawan = 'Group 1',
      this.gambar = ''});

  @override
  State<HalamanDataRelawan> createState() => _HalamanDataRelawanState();
}

class _HalamanDataRelawanState extends State<HalamanDataRelawan> {
  List<DataRelawan> _allUsers = [];

  List<DataRelawan> _foundUsers = [];
  @override
  initState() {
    var data = context.read<DatarelawanBloc>().state;
    if (data is DataRelawanLoaded) {
      _allUsers = data.data!;
      _foundUsers = _allUsers;
    }
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<DataRelawan> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user.nama!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Relawan",
                textAlign: TextAlign.start,
                style: textpoppin.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                width: p1.maxWidth * 0.25,
                height: p1.maxHeight * 0.05,
                decoration: BoxDecoration(
                    color: colorbiru, borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanTemplateData(
                                    haldata: const HalamanTambahDataRelawan(),
                                  )));
                    },
                    child: Text(
                      "Tambah",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.02,
                          color: putih,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: p1.maxWidth * 0.7,
                height: p1.maxHeight * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorbiru),
                    borderRadius: BorderRadius.circular(15),
                    color: putih),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.02),
                  decoration: const InputDecoration(
                      hintText: 'Masukkan Nama Relawan',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 5, left: 5)),
                ),
              ),
              Container(
                width: p1.maxWidth * 0.25,
                height: p1.maxHeight * 0.05,
                decoration: BoxDecoration(
                    color: colorbiru, borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cari",
                      style: textpoppin.copyWith(
                          fontSize: p1.maxHeight * 0.02,
                          color: putih,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.75,
            child: _foundUsers.isNotEmpty
                ? GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _foundUsers.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (1 / .4),
                        crossAxisCount: 1,
                        mainAxisSpacing: p1.maxHeight * 0.02,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) => FutureBuilder<SemuaDaerah>(
                      future: auth.getprovkabupatenkecamatan(
                          gruprelawan:
                              _foundUsers[index].gruprelawan_id.toString(),
                          kabupaten: _foundUsers[index].regency_id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HalamanTemplateData(
                                            haldata: HalamanDetailRelawan(
                                                gambar: _foundUsers[index].foto,
                                                relawan: _foundUsers[index]
                                                    .nama
                                                    .toString(),
                                                noktp: _foundUsers[index]
                                                    .nik
                                                    .toString(),
                                                notelepon: _foundUsers[index]
                                                    .no_hp
                                                    .toString(),
                                                tempatlahir: _foundUsers[index]
                                                    .tempat_lahir
                                                    .toString(),
                                                tanggallahir: _foundUsers[index]
                                                    .tanggal_lahir
                                                    .toString(),
                                                agama: _foundUsers[index]
                                                    .agama
                                                    .toString(),
                                                jeniskelamin: _foundUsers[index]
                                                    .jkl
                                                    .toString(),
                                                gruprelawan:
                                                    snapshot.data!.gruprelawan,
                                                kabupaten:
                                                    snapshot.data!.kabupaten),
                                          )));
                            },
                            child: Container(
                              width: p1.maxWidth,
                              height: p1.maxHeight * 0.2,
                              decoration: BoxDecoration(
                                  color: abuabu,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: p1.maxHeight * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      radius: 48,
                                      backgroundImage: NetworkImage(
                                          'https://web-sisfopilkada.taekwondosulsel.info/public/storage/${_foundUsers[index].foto}'),
                                    ),
                                    Text(
                                      'Nama Relawan\nGrup Relawan',
                                      textAlign: TextAlign.center,
                                      style: textpoppin.copyWith(
                                          fontSize: p1.maxHeight * 0.02),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        '${_foundUsers[index].nama}\n${snapshot.data!.gruprelawan}',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: textpoppin.copyWith(
                                            fontSize: p1.maxHeight * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return const SpinKitDualRing(
                          color: colororange,
                        );
                      },
                    ),
                  )
                : Text(
                    "Data Not Connected",
                    style: textpoppin,
                  ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: p1.maxHeight * 0.02),
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.06,
              decoration: BoxDecoration(
                  color: putihh, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanConnect(page: '1'));
                    },
                    child: const Text("1"),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanConnect(page: '2'));
                    },
                    child: const Text("2"),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanConnect(page: '3'));
                    },
                    child: const Text("3"),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanConnect(page: '4'));
                    },
                    child: const Text("4"),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<DatarelawanBloc>()
                          .add(DataRelawanConnect(page: '4'));
                    },
                    child: const Text(">"),
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
