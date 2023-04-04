part of '../pages.dart';

class DashBoardcalek extends StatelessWidget {
  const DashBoardcalek({super.key});

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
                        Text("JUMLAH TPS",
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
                                  Text("${state.data!.tps}",
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
                                        Text("${state.data!.kordinator}",
                                            style: textpoppin.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                        Text("KOORDINATOR",
                                            style: textpoppin.copyWith(
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                      ]),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("${state.data!.relawan}",
                                            style: textpoppin.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                        Text("Relawan",
                                            style: textpoppin.copyWith(
                                                fontSize:
                                                    p1.maxHeight * 0.042)),
                                      ]),
                                ])),
                      ],
                    ))
            : const Text("");
      },
    );
  }
}
