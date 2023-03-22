part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isemailvalid = false;

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AppStarted());

    _onLoginbuttonpressed() {
      context
          .read<LoginBloc>()
          .add(LoginButton(email: username.text, password: password.text));
    }

    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: pinkabu,
        body: Stack(children: [
          Image.asset('assets/backgroundlogin.png',
              width: p1.maxWidth, fit: BoxFit.fitWidth),
          Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.15,
                left: p1.maxWidth * 0.032,
                right: p1.maxWidth * 0.032),
            child: Column(
              children: [
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxHeight * 0.02,
                          right: p1.maxHeight * 0.02),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MASUK",
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: hitam,
                                  fontSize: p1.maxHeight * 0.02),
                            ),
                            Text(
                              "APLIKASI PILKADA",
                              style: textpoppin.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: pink,
                                  fontSize: p1.maxHeight * 0.03),
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: putih,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      onChanged: (text) {
                                        isemailvalid =
                                            EmailValidator.validate(text);
                                      },
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      controller: username,
                                      style: textpoppin,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: textpoppin.copyWith(
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: putih,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    controller: password,
                                    style: textpoppin,
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.07,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state is LoginLoaded
                        ? const SpinKitFadingFour(
                            color: birumuda,
                            size: 50,
                          )
                        : ButtonUtama(
                            voidcallback: () {
                              _onLoginbuttonpressed();
                              setState(() {});
                            },
                            namabutton: 'MASUK',
                            width: p1.maxWidth * 0.5,
                            height: p1.maxHeight * 0.05);
                  },
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state is LoginFailure
                        ? Text(
                            "Password atau Username Salah",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02, color: hitam),
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
