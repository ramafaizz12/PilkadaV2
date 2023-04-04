part of 'pages.dart';

class NikValid extends StatefulWidget {
  const NikValid({super.key});

  @override
  _NikValidState createState() => _NikValidState();
}

class _NikValidState extends State<NikValid> {
  final nikController = TextEditingController();
  NIKModel? nikResult;

  ///Validate NIK informations
  void validate() async {
    if (nikController.text.isNotEmpty) {
      NIKModel result =
          await NIKValidator.instance.parse(nik: nikController.text);

      ///use result.valid to check if the nik is valid
      setState(() {
        nikResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _fieldNIK(),
              _buttonParse(),
              const SizedBox(height: 20),
              nikResult != null ? _resultWidget() : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultWidget() {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textWidgeT(title: "NIK", value: nikResult!.nik!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Kode Unik", value: nikResult!.uniqueCode!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Jenis Kelamin", value: nikResult!.gender!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Tanggal Lahir", value: nikResult!.bornDate!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Usia", value: nikResult!.age!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Ulang Tahun", value: nikResult!.nextBirthday!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Zodiak", value: nikResult!.zodiac!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Provinsi", value: nikResult!.province!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Kota/Kabupaten", value: nikResult!.city!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Kecamatan", value: nikResult!.subdistrict!),
            const Divider(color: Colors.black),
            _textWidgeT(title: "Kode Pos", value: nikResult!.postalCode!),
          ],
        ),
      ),
    );
  }

  Widget _textWidgeT({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget _fieldNIK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: nikController,
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: "Masukkan nomor NIK",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "NIK"),
        ),
        const SizedBox(height: 5),
        nikResult != null && nikResult!.valid == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kode NIK tidak valid",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                ],
              )
            : const SizedBox()
      ],
    );
  }

  Widget _buttonParse() {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () => validate(),
        child: const Text(
          "Validate NIK",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
