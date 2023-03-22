part of 'pages.dart';

class HalamanLoading extends StatelessWidget {
  const HalamanLoading({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    context.read<DataprofileBloc>();

    return const Scaffold(
      backgroundColor: putih,
      body: Center(
        child: SpinKitThreeBounce(
          color: birumuda,
          size: 80,
        ),
      ),
    );
  }
}
