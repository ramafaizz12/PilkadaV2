part of 'pages.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    context.read<DataprofileBloc>();
    return BlocBuilder<DataprofileBloc, DataprofileState>(
      builder: (context, state) {
        if (state is DataprofileLoaded) {
          if (state.data!.role == 'admin') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectAdmin());
            return HomePage(
                haldata: HalamanDataAdmin(), dashboard: const DashboardAdmin());
          }
          if (state.data!.role == 'saksi') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectSaksi());
            return HomePage(
                haldata: HalamanDataSaksi(), dashboard: const DashboardSaksi());
          }
          if (state.data!.role == 'calek') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectCalek());
            return HomePage(
                haldata: HalamanDataCalek(), dashboard: const DashBoardcalek());
          }
          if (state.data!.role == 'kordinator') {
            context
                .read<DatadashboardBloc>()
                .add(DatadashboardConnectKordinator());
            return HomePage(
                haldata: HalamanDataKoordinator(),
                dashboard: const Dashboarkoordinator());
          }
          if (state.data!.role == 'relawan') {
            context
                .read<DatadashboardBloc>()
                .add(DatadashboardConnectRelawan());
            return HomePage(
                haldata: HalamanDataRelawann(),
                dashboard: const DashboardRelawan());
          }
          if (state.data!.role == 'cabup') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectCalek());
            return HomePage(
                haldata: HalamanDataCalek(), dashboard: const DashBoardcalek());
          }
        }
        return const HalamanLoading();
      },
    );
  }
}
