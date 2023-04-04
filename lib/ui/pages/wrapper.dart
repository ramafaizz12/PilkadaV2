part of 'pages.dart';

class Wrapper extends StatelessWidget {
  static const String routename = '/wrapperpage';

  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthAuthenticated) {
        context.read<DataprofileBloc>().add(DataProfileConnect());
        // return HomePage(
        //     haldata: HalamanDataAdmin(), dashboard: DashboardAdmin());
        return const Role();
      }
      if (state is AuthUthenticated) {
        return const LoginPage();
      }
      return const HalamanLoading();
    });
  }
}
