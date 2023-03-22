part of 'pages.dart';

class Wrapper extends StatelessWidget {
  static const String routename = '/wrapperpage';
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthAuthenticated) {
        context.read<DataprofileBloc>().add(DataProfileConnect());
        // return HomePage(haldata: HalamanDataa(), dashboard: DashboardAdmin());
        return Role();
      }
      if (state is AuthUthenticated) {
        return LoginPage();
      }
      return const HalamanLoading();
    });
  }
}
