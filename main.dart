import 'package:fatouma/controlleurs/home-controller.dart';
import 'package:fatouma/vue/analyse-vue.dart';
import 'package:fatouma/vue/analyse2-vue.dart';
import 'package:fatouma/vue/anatomical-anomalies-vue.dart';
import 'package:fatouma/vue/associated-diseases-vue.dart';
import 'package:fatouma/vue/biochemist-home-vue.dart';
import 'package:fatouma/vue/biochemist-list-vue.dart';
import 'package:fatouma/vue/calcul-vue.dart';
import 'package:fatouma/vue/drainage-vue.dart';
import 'package:fatouma/vue/general-factors-vue.dart';
import 'package:fatouma/vue/genetic-desease-vue.dart';
import 'package:fatouma/vue/medication-vue.dart';
import 'package:fatouma/vue/new-patient-vue.dart';
import 'package:fatouma/vue/patient-detail-vue.dart';
import 'package:fatouma/vue/patient-list-vue.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fatouma/theme/theme.dart';
import 'package:fatouma/vue/welcome.dart';
import 'package:fatouma/vue/signin-view.dart';
import 'package:fatouma/vue/signup-view.dart';
import 'package:fatouma/vue/home.dart';
import '../controlleurs/signup-controller.dart';
import '../controlleurs/signin-controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD3k5_DpCBxwJcXidHNFvHwKdxXrX8_CT0",
      projectId: "pfem-83e67",
      appId: "1:693695354747:web:d5c9c1cfb47e53c7b80fde",
      databaseURL: "https://pfem-83e67-default-rtdb.europe-west1.firebasedatabase.app/",
      messagingSenderId: "693695354747",
      storageBucket: "gs://pfem-83e67.appspot.com",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/signin': (context) => SignInView(controller: SignInController()),
        '/signup': (context) => SignUpScreen(controller: SignUpController()),
        '/home': (context) => Home(),
        '/new_patient': (context) => NewPatientPage(),
        '/anatomical_anomalies': (context) => AnatomicalAnomaliesPage(patientId: _getArgumentAsString(context)),
        '/associated_diseases': (context) => AssociatedDiseasesPage(patientId: _getArgumentAsString(context)),
        '/general_factors': (context) => GeneralFactorsPage(patientId: _getArgumentAsString(context)),
        '/genetic_diseases': (context) => GeneticDiseasesPage(patientId: _getArgumentAsString(context)),
        '/medications': (context) => MedicationPage(patientId: _getArgumentAsString(context)),
        '/calcul': (context) => CalculPage(patientId: _getArgumentAsString(context)),
        '/drainage': (context) => DrainagePage(patientId: _getArgumentAsString(context)),
        '/patientdetail': (context) => PatientDetailPage(patientId: _getArgumentAsString(context)),
        '/patientslist': (context) => PatientListPage(),
        '/biochemist-home': (context) => HomeBio(),
        '/biochemist-list': (context) => BiochemistPatientListPage(),
        '/analyse1': (context) => AnalysePage(patientId: _getArgumentAsString(context)),
        '/analyse2': (context) => Analyse2Page(patientId: _getArgumentAsString(context)),
      },
    );
  }

  String _getArgumentAsString(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print('Error: No arguments passed to route.');
      return '';
    }
    if (args is String) {
      return args;
    } else {
      print('Error: Argument is not a String.');
      return '';
    }
  }
}
