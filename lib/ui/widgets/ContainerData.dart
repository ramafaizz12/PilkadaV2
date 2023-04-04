part of 'widgets.dart';

class ContainerData extends StatelessWidget {
  final VoidCallback? fungsi;
  final String? nama;
  final double? width;
  final double? height;
  Color? color = putih;

  ContainerData(
      {super.key, required this.fungsi,
      required this.nama,
      this.color,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: fungsi,
          child: Container(
              margin: const EdgeInsets.only(top: 7),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: hitam, width: 1.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  nama!,
                  style: textpoppin,
                ),
              )),
        ),
      ],
    );
  }
}
