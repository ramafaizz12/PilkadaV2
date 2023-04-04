part of 'pages.dart';

class HalamanTemplateData extends StatefulWidget {
  static const String routename = '/HalamanTemplateData';

  dynamic haldata;

  HalamanTemplateData({super.key, this.haldata});

  @override
  State<HalamanTemplateData> createState() => _HalamanTemplateDataState();
}

class _HalamanTemplateDataState extends State<HalamanTemplateData> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: putih,
        body: Stack(
          children: [
            Container(
              width: p1.maxWidth,
              height: p1.maxHeight,
              decoration: const BoxDecoration(gradient: colorbackground),
            ),
            SvgPicture.asset(
              'assets/bg_atas.svg',
              width: p1.maxWidth,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: p1.maxHeight * 0.08,
                  left: p1.maxWidth * 0.03,
                  right: p1.maxWidth * 0.03),
              child: SizedBox(
                height: p1.maxHeight,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: p1.maxHeight * 0.04,
                          right: p1.maxWidth * 0.04,
                          left: p1.maxWidth * 0.04),
                      child: widget.haldata),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: p1.maxHeight * 0.02),
              child: SizedBox(
                width: p1.maxWidth * 0.1,
                height: p1.maxHeight * 0.1,
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 10,
                    backgroundColor: colororange,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
