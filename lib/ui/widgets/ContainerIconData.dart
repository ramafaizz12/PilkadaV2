part of 'widgets.dart';

class ContainerDatabaru extends StatelessWidget {
  final String gambar;
  final String nama;
  final double? width;
  final double? height;
  final VoidCallback fungsi;

  const ContainerDatabaru({super.key, 
    required this.height,
    required this.width,
    required this.nama,
    required this.gambar,
    required this.fungsi,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fungsi,
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: p1.maxWidth * 0.7,
              height: p1.maxHeight * 0.7,
              decoration:
                  const BoxDecoration(color: birumuda, shape: BoxShape.circle),
              child: SvgPicture.asset(
                gambar,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              nama,
              textAlign: TextAlign.center,
              style: textpoppin.copyWith(
                  color: hitam, fontSize: p1.maxHeight * 0.11),
            )
          ],
        ),
      ),
    );
  }
}
