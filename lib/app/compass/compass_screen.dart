import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('القبلة'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<LocationStatus>(
          stream: _locationStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }

            final locationStatus = snapshot.data;

            if (locationStatus == null) {
              return _buildErrorWidget("Failed to get location status");
            }

            if (!locationStatus.enabled) {
              return LocationErrorWidget(
                error: "Please enable Location service",
                callback: _checkLocationStatus,
              );
            }

            switch (locationStatus.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return const QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location permission denied",
                  callback: _checkLocationStatus,
                );

              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location permission denied forever",
                  callback: _checkLocationStatus,
                );

              default:
                return _buildErrorWidget("Unknown Location status");
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();

    if (!locationStatus.enabled) {
      await Geolocator.openLocationSettings();

      final updatedStatus = await FlutterQiblah.checkLocationStatus();

      if (mounted) {
        _locationStreamController.sink.add(updatedStatus);
      }
    } else if (locationStatus.status == LocationPermission.denied) {
      final permission = await FlutterQiblah.requestPermissions();

      final updatedStatus = await FlutterQiblah.checkLocationStatus();

      if (mounted) {
        _locationStreamController.sink.add(updatedStatus);
      }
    } else {
      // لو كل حاجة تمام هنحدث الـ Stream
      if (mounted) {
        _locationStreamController.sink.add(locationStatus);
      }
    }
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  const QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CupertinoActivityIndicator();
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("Failed to get Qibla direction"));
        }

        final qiblahDirection = snapshot.data!;
        var angle = (qiblahDirection.qiblah) * (pi / 180) * -1;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: angle,
              child: SvgPicture.asset(
                'assets/images/svgimages/5.svg',
              ),
            ),
            SvgPicture.asset(
              'assets/images/svgimages/4.svg',
              width: 300,
              height: 300,
            ),
            SvgPicture.asset(
              'assets/images/svgimages/3.svg',
            ),
          ],
        );
      },
    );
  }
}

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback callback;

  const LocationErrorWidget({
    Key? key,
    required this.error,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorColor = Colors.white;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.location_off,
            size: 150,
            color: errorColor,
          ),
          const SizedBox(height: 16),
          Text(
            error,
            style: TextStyle(
              color: errorColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
            onPressed: callback,
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.teal[500]),
            ),
          ),
        ],
      ),
    );
  }
}
