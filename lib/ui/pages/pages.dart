import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nik_validator/nik_validator.dart';
import 'package:pilkada/bloc/datakordinator/datakoordinator_bloc.dart';
import 'package:pilkada/extensions/extensions.dart';
import 'package:pilkada/models/Kabupaten.dart';
import 'package:pilkada/shared/themecolor.dart';
import 'package:pilkada/ui/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quickalert/quickalert.dart';

import '../../bloc/DataDashboard/datadashboard_bloc.dart';
import '../../bloc/DataRelawan/datarelawan_bloc.dart';

import '../../bloc/Datadpt/datadpt_bloc.dart';
import '../../bloc/Datakandidat/datakandidat_bloc.dart';
import '../../bloc/Dataprofile/dataprofile_bloc.dart';
import '../../bloc/Datatps/datatps_bloc.dart';
import '../../bloc/dataaksesoris/dataaksesoris_bloc.dart';
import '../../bloc/dataperolehansuara/dataperolehansuara_bloc.dart';
import '../../bloc/datasaksi/datasaksi_bloc.dart';

import '../../bloc/loginandauth/auth_bloc.dart';
import '../../bloc/loginandauth/login_bloc.dart';

import '../../models/Kecamatan.dart';
import '../../models/Provinsi.dart';

import '../../models/datadaerah.dart';
import '../../models/datagruprelawan.dart';

import '../../models/datarelawan.dart';

import '../../services/AuthService.dart';

part 'HalamanLoading.dart';
part 'loadingpage.dart';
part 'loginpage.dart';
part 'HalamanSettings.dart';
part 'Role.dart';
part 'SplashScreen.dart';
part 'Halamancamerabaru.dart';
part 'HalamanCamera.dart';
part 'Dashboard/DashboardKoordinator.dart';
part 'HomePage.dart';
part 'HalamanMenu/HalamanDataCalek.dart';
part 'HalamanCaleg.dart';
part 'HalamanTambahDataSaksi.dart';
part 'HalamanTemplateBaru.dart';
part 'halamanhome.dart';
part 'Dashboard/DashboardRelawan.dart';
part 'halamanTemplate.dart';
part 'HalamanMenu/HalamanDataa.dart';
part 'HalamanMenu/HalamanDataSaksi.dart';
part 'HalamanMenu/HalamanDataKoordinator.dart';
part 'HalamanMenu/HalamanDataAdmin.dart';
part 'Dashboard/DashboardSaksi.dart';
part 'HalamanTambahDataRelawan.dart';
part 'HalamanProfile.dart';
part 'HalamanTemplateAwal.dart';
part 'DetailDpt.dart';
part 'HalamanMenu/HalamanKoorkomunitas.dart';
part 'Dashboard/DashboardAdmin.dart';
part 'HalamanMenu/HalamanDataRelawan.dart';
part 'Dashboard/DashboardCalek.dart';
part 'DetailRelawan.dart';
part 'Halamankordinatorkomunitas.dart';
part 'HalamanTemplateData.dart';
part 'HalamanTambahdataCaleg.dart';
part 'HalamanDataGrupRelawan.dart';
part 'HalamanKoordinator.dart';
part 'HalamanDataAksesoris.dart';
part 'HalamanTambahDataKoordinator.dart';
part 'HalamanDatarelawan.dart';
part 'HalamanDataSaksi.dart';
part 'DataPerolehanSuara.dart';
part 'wrapper.dart';
part 'HalamanTambahDataTps.dart';
part 'HalamanDataTps.dart';
part 'HalamanPerolehanSuara.dart';
part 'NikValidator.dart';
part 'HalamanDatarelawancoba.dart';
part 'HalamanJumlahdpt.dart';
part 'DetailSaksi.dart';
part 'DetailKoordinator.dart';
part 'HalamanTambahSaksinew.dart';
