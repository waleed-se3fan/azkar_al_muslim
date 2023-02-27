import 'dart:collection';

import 'package:azkar_al_muslim/app/Home_screen/bottomNB.dart';
import 'package:azkar_al_muslim/app/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            theme: AppCubit.isDarkMode ? ThemeData.dark() : ThemeData(),
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: MyGoogleMap()),
          );
        },
      ),
    );
  }
}

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  var myMarkers = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Map'),
      ),
      body: GoogleMap(
          markers: myMarkers,
          onMapCreated: (controller) {
            myMarkers
                .add(Marker(markerId: MarkerId('1'), position: LatLng(30, 30)));
            myMarkers
                .add(Marker(markerId: MarkerId('2'), position: LatLng(31, 30)));
            setState(() {});
          },
          initialCameraPosition: CameraPosition(target: LatLng(30, 30))),
    );
  }
}
