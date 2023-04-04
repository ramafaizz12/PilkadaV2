part of 'widgets.dart';

class ContainerTps extends StatelessWidget {
  final String nama;
  final double width;
  final double height;
  final String angka;
  const ContainerTps(
      {super.key, required this.width,
      required this.height,
      required this.nama,
      required this.angka});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: hitam.withOpacity(0.2), offset: const Offset(3, 3))
      ], color: abuabu, borderRadius: BorderRadius.circular(15)),
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(angka,
                textAlign: TextAlign.center,
                style: textpoppin.copyWith(
                    fontSize: p1.maxHeight * 0.15,
                    color: hitam,
                    fontWeight: FontWeight.w600)),
            Text(nama,
                textAlign: TextAlign.center,
                style: textpoppin.copyWith(
                    fontSize: p1.maxHeight * 0.08,
                    color: hitam,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
