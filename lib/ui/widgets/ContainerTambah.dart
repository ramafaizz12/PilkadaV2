part of 'widgets.dart';

class ContainerTambah extends StatelessWidget {
  double? width;
  double? height;
  VoidCallback? fungsi;

  ContainerTambah({super.key, this.height, this.width, this.fungsi});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fungsi,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: const Offset(2, 4))
              ],
              color: birumuda),
          child: LayoutBuilder(
            builder: (p0, p2) => Column(children: [
              Icon(Icons.add, color: putih, size: p2.maxHeight * 0.5),
              Text("Tambah",
                  style: textpoppin.copyWith(
                      color: putih, fontSize: p2.maxHeight * 0.2))
            ]),
          )),
    );
  }
}
