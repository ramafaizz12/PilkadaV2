part of 'widgets.dart';

class ContainerInput extends StatefulWidget {
  String nama;
  TextEditingController control = TextEditingController();
  Function(String)? fungsi;
  double width;
  double height;
  String? hint;

  TextInputType? tipekeyboard;
  Color warnaborder;
  VoidCallback? ontapfield;

  ContainerInput(
      {super.key, required this.nama,
      required this.control,
      required this.width,
      required this.height,
      this.hint,
      this.ontapfield,
      this.fungsi,
      this.tipekeyboard,
      this.warnaborder = hitam});

  @override
  State<ContainerInput> createState() => _ContainerInputState();
}

class _ContainerInputState extends State<ContainerInput> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nama,
              style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.24),
            ),
            Container(
              width: p1.maxWidth,
              margin: EdgeInsets.only(top: p1.maxHeight * 0.05),
              height: p1.maxHeight * 0.5,
              decoration: BoxDecoration(
                  color: putih,
                  border: Border.all(width: 1.0, color: hitam),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: widget.control,
                onTap: widget.ontapfield,
                maxLines: 1,
                keyboardType: widget.tipekeyboard,
                style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.24),
                decoration: InputDecoration(
                    hintText: widget.hint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 5, left: 5)),
                onChanged: widget.fungsi,
              ),
            )
          ],
        ),
      ),
    );
  }
}
