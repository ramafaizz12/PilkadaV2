part of '../pages.dart';

class DashboardSaksi extends StatelessWidget {
  const DashboardSaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // kasih kondisi sini
        BlocBuilder<DatadashboardBloc, DatadashboardState>(
      builder: (context, state) {
        return state is DataDashboardLoaded
            ? LayoutBuilder(
                builder: (p0, p1) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JUMLAH DPT",
                            style: textpoppin.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: p1.maxHeight * 0.05)),
                        Container(
                            width: p1.maxWidth,
                            height: p1.maxHeight * 0.45,
                            decoration: BoxDecoration(
                              color: putih,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${state.data!.dpt}",
                                      style: textpoppin.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: p1.maxHeight * 0.07)),
                                  SvgPicture.asset('assets/asses.svg')
                                ])),
                        SizedBox(
                          height: p1.maxHeight * 0.05,
                        ),
                        Text("JUMLAH DATA",
                            style: textpoppin.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: p1.maxHeight * 0.05)),
                        Container(
                            width: p1.maxWidth,
                            height: p1.maxHeight * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 5,
                                    offset: const Offset(2, 4))
                              ],
                              color: putih,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("${state.data!.saksi}",
                                            style: textpoppin.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                        Text("SAKSI",
                                            style: textpoppin.copyWith(
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                      ]),
                                ])),
                      ],
                    ))
            : Text("");
      },
    );
  }
}
