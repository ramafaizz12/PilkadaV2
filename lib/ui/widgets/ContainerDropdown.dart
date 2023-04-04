part of 'widgets.dart';

class Containerdropdown extends StatefulWidget {
  double width;
  double height;
  String? selecitem;
  String nama;
  List<String> items = const [];
  Function(String?)? oncanged;
  Future<List<String>> Function(String)? asyncitem;
  String hinttext;
  Containerdropdown(
      {super.key, this.width = 1,
      this.height = 1,
      this.selecitem,
      this.nama = '',
      this.oncanged,
      this.items = const [],
      this.asyncitem,
      this.hinttext = ''});

  @override
  State<Containerdropdown> createState() => _ContainerdropdownState();
}

class _ContainerdropdownState extends State<Containerdropdown> {
  String? selecitem;

  @override
  void initState() {
    super.initState();
    setState(() {
      selecitem = widget.selecitem;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.selecitem);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: LayoutBuilder(
        builder: (p0, p1) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nama,
              style: textpoppin.copyWith(fontSize: p1.maxHeight * 0.14),
            ),
            DropdownSearch<String>(
              selectedItem: selecitem,
              asyncItems: widget.asyncitem,
              items: widget.items,
              onChanged: widget.oncanged,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: textpoppin.copyWith(fontWeight: FontWeight.w600),
                  dropdownSearchDecoration: InputDecoration(
                      hintText: widget.hinttext,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            )
          ],
        ),
      ),
    );
  }
}
