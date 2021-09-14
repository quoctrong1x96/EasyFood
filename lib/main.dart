/*
 * Copyright (c) 2021 Akshay Jadhav <jadhavakshay0701@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// import 'package:cenafood/models/userModels/UserProfile.dart';
// import 'package:cenafood/resources/AuthMethod.dart';
// import 'package:cenafood/screens/login/UserLoginPage.dart';
import 'package:cenafood/shared/theme.dart';
import 'package:cenafood/states/bloc/page_bloc.dart';
import 'package:cenafood/states/bloc/user_bloc.dart';
import 'package:cenafood/states/provider/navigation_provider.dart';
import 'package:cenafood/states/provider/validation_provider.dart';
import 'package:cenafood/ui/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {
            runApp(CenaFood()),
          });
}

/// Declaring root class of this project.
class CenaFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ValidationProvider()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: GetMaterialApp(
          title: "Cena Food",
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
// class CenaFood extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _CenaFoodState createState() => _CenaFoodState();
// }

// class _CenaFoodState extends State<CenaFood> {
//   final AuthMethods _authMethods = AuthMethods();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Food App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: null, //UniversalVariables.orangeAccentColor,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: "Enriqueta",
//       ),
//       home: FutureBuilder(
//         future: _authMethods.getUserAccount("admin", "admin"),
//         builder: (context, AsyncSnapshot<UserProfile> snapshot) {
//           if (snapshot.hasData) {
//             return UserLoginPage();
//           } else {
//             return UserLoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
