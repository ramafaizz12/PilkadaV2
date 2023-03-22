part of 'widgets.dart';

class ButtonUtama extends StatelessWidget {
  final double? width;
  final double? height;
  final String? namabutton;

  final VoidCallback? voidcallback;

  ButtonUtama({this.width, this.height, this.namabutton, this.voidcallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: birumuda,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4))
          ]),
      child: TextButton(
          onPressed: voidcallback,
          child: LayoutBuilder(
            builder: (p0, p1) => Text(
              '$namabutton',
              style: textpoppin.copyWith(
                  color: hitam,
                  fontSize: p1.maxHeight * 0.5,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
