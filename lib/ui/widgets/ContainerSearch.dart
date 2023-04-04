part of 'widgets.dart';

class ContainerSearch extends StatefulWidget {
  double width;
  double height;
  String hinttext;
  Function(String)? cari;

  ContainerSearch(
      {super.key, this.width = 0.1,
      this.height = 0.1,
      this.hinttext = 'Search',
      this.cari});

  @override
  State<ContainerSearch> createState() => _ContainerSearchState();
}

class _ContainerSearchState extends State<ContainerSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: putih,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(2, 4))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: widget.cari,
              decoration: InputDecoration(
                  hintText: widget.hinttext,
                  hintStyle: textpoppin,
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 5, left: 5),
                  border: InputBorder.none),
            )));
  }
}
