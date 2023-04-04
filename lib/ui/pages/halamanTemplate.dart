part of 'pages.dart';

class HalamanTemplate extends StatelessWidget {
  final HalamanTambahDataRelawan? haltambahdata;
  final HalamanProfile? halprofile;
  final HalamanDataAdmin? haldata;

  const HalamanTemplate({super.key, 
    this.halprofile,
    this.haltambahdata,
    this.haldata,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SizedBox(
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
            child: haltambahdata ?? halprofile ?? haldata,
          ),
        ),
      ),
    );
  }
}
