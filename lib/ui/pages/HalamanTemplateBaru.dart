part of 'pages.dart';

class HalamanTemplateBaru extends StatelessWidget {
  dynamic halamandata;
  String? nama;
  HalamanTemplateBaru({this.halamandata, this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: pinkabu,
      body: LayoutBuilder(
          builder: (p0, p1) => Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                        width: p1.maxWidth,
                        'assets/backgroundTemplate.png',
                        fit: BoxFit.fitWidth),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: p1.maxHeight * 0.1,
                        left: p1.maxWidth * 0.07,
                        right: p1.maxWidth * 0.07),
                    child: halamandata,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: p1.maxHeight * 0.07,
                        left: p1.maxWidth * 0.07,
                        right: p1.maxWidth * 0.07),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: p1.maxHeight * 0.05,
                            ),
                          ),
                          SizedBox(width: p1.maxWidth * 0.28),
                          Text(nama!,
                              textAlign: TextAlign.center,
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: hitam,
                                  fontSize: p1.maxHeight * 0.02))
                        ],
                      ),
                    ]),
                  ),
                ],
              )),
    );
  }
}
