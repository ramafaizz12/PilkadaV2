part of 'widgets.dart';

class ViewSvg extends StatelessWidget {
  final double? width;
  final double? height;

  final String? katabody;
  final String? gambar;
  final int? index;

  const ViewSvg({super.key, this.width, this.height, this.katabody, this.gambar, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: SvgPicture.asset(
            '$gambar',
            width: width,
            height: height,
          ),
        ),
        Text(
          '$katabody',
          style: textpoppin,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
