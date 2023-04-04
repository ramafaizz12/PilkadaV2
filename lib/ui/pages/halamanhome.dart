part of 'pages.dart';

class HalamanHome extends StatelessWidget {
  dynamic haldata;
  dynamic dashboard;

  HalamanHome({super.key, this.haldata, this.dashboard});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: putih, width: 4.0)),
            width: p1.maxWidth * 0.16,
            height: p1.maxHeight * 0.16,
            child: const CircleAvatar(
                radius: 50, backgroundImage: AssetImage('assets/avatar.png')),
          ),
          BlocBuilder<DataprofileBloc, DataprofileState>(
            builder: (context, state) {
              if (state is DataprofileLoaded) {
                return Text("Halo, Nama ${state.data!.role}",
                    style: textpoppin.copyWith(fontWeight: FontWeight.w600));
              }
              return const Text("");
            },
          ),
          Text(DateTime.now().day.toString(), style: textpoppin),
          SizedBox(height: p1.maxHeight * 0.02),
          ContainerSearch(width: p1.maxWidth, height: p1.maxHeight * 0.05),
          SizedBox(
            height: p1.maxHeight * 0.02,
          ),
          SizedBox(
            width: p1.maxWidth,
            height: p1.maxHeight * 0.1,
            //kasih kondisi sini
            child: haldata,
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.35,
              child: dashboard),
        ],
      ),
    );
  }
}
