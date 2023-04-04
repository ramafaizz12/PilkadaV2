import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pilkada/bloc/DataRelawan/datarelawan_bloc.dart';
import 'package:pilkada/bloc/Dataprofile/dataprofile_bloc.dart';
import 'package:pilkada/bloc/datakordinator/datakoordinator_bloc.dart';
import 'package:pilkada/bloc/dataperolehansuara/dataperolehansuara_bloc.dart';
import 'package:pilkada/bloc/loginandauth/auth_bloc.dart';
import 'package:pilkada/bloc/loginandauth/login_bloc.dart';

import 'package:pilkada/services/AuthService.dart';
import 'bloc/DataDashboard/datadashboard_bloc.dart';

import 'bloc/Datadpt/datadpt_bloc.dart';
import 'bloc/Datakandidat/datakandidat_bloc.dart';
import 'bloc/Datatps/datatps_bloc.dart';
import 'bloc/dataaksesoris/dataaksesoris_bloc.dart';
import 'bloc/datasaksi/datasaksi_bloc.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Authentication auth = Authentication();
  AuthBloc authbloc = AuthBloc();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(auth: auth)..add(AppStarted()),
        ),
        BlocProvider<DatadptBloc>(
          create: (context) => DatadptBloc(auth: auth),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(auth: auth, authbloc: authbloc),
        ),
        BlocProvider<DatatpsBloc>(
          create: (context) => DatatpsBloc(auth: auth),
        ),
        BlocProvider<DataperolehansuaraBloc>(
          create: (context) => DataperolehansuaraBloc(auth: auth),
        ),
        BlocProvider<DataaksesorisBloc>(
          create: (context) => DataaksesorisBloc(auth: auth),
        ),
        BlocProvider<DatakandidatBloc>(
          create: (context) => DatakandidatBloc(auth: auth),
        ),
        BlocProvider<DatasaksiBloc>(
          create: (context) => DatasaksiBloc(auth: auth),
        ),
        BlocProvider<DatarelawanBloc>(
          create: (context) => DatarelawanBloc(auth: auth),
        ),
        BlocProvider<DatakoordinatorBloc>(
          create: (BuildContext context) => DatakoordinatorBloc(auth: auth),
        ),
        BlocProvider<DataprofileBloc>(
          create: (BuildContext context) => DataprofileBloc(auth: auth),
        ),
        BlocProvider<DatadashboardBloc>(
          create: (BuildContext context) => DatadashboardBloc(auth: auth),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (authbloc.state is AuthAuthenticated)
            ? const Wrapper()
            : (authbloc.state is AuthUthenticated)
                ? const LoadingPage()
                : const Wrapper(),
      ),
    );
  }
}
