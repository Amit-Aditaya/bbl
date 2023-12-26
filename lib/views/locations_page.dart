import 'package:flutter/material.dart';
import 'package:flutter_babuland_app/custom_widgets/custom_app_bar.dart';
import 'package:flutter_babuland_app/data/repository/map_direction_repository.dart';
import 'package:flutter_babuland_app/theme_helpers/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  static const initialCameraPosition =
      CameraPosition(target: LatLng(23.8103, 90.4125), zoom: 11);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  Set<Marker> markers = Set();
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
    addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.directions),
          )
        ],
        //centerTitle: true,
        title: FittedBox(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () async {
                Position position = await _determinePosition();
                MapDirectionRepository.openMap(
                    position.latitude, position.longitude, 'North+Tower');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryGreen,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: const Text(
                  'Uttara',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                Position position = await _determinePosition();
                MapDirectionRepository.openMap(
                    position.latitude, position.longitude, '16+Fazie+Rabbi+Rd');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryBlue,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: const Text(
                  'Wari',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                Position position = await _determinePosition();
                MapDirectionRepository.openMap(
                    position.latitude, position.longitude, 'SS+Steel+Limited');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryPink,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: const Text(
                  'Badda',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                Position position = await _determinePosition();
                MapDirectionRepository.openMap(position.latitude,
                    position.longitude, 'Mirpur+Shopping+Center+Complex');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.primaryPurple,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: const Text(
                  'Mirpur',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ]),
        ),
      ),
      //  appBar: CustomAppBar(title: 'Locations', backgroundColor: Colors.white),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: LocationsPage.initialCameraPosition,
          markers: markers,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          onCameraMove: (CameraPosition cameraPosition) {
            cameraPosition.zoom;
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          Position position = await _determinePosition();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 12)));
          markers.add(Marker(
              markerId: const MarkerId('Current Location'),
              position: LatLng(position.latitude, position.longitude)));
          setState(() {});
        },
        child: Icon(
          Icons.location_searching,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  addMarkers() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(10, 10),
      ),
      "assets/images/marker.png",
    );

    markers.add(const Marker(
      markerId: MarkerId('Current'),
      icon: BitmapDescriptor.defaultMarker,
    ));

    markers.add(Marker(
      markerId: const MarkerId('Mirpur'),
      position: const LatLng(23.80480, 90.36358),
      icon: markerbitmap,
    ));

    markers.add(Marker(
      markerId: const MarkerId('Uttara'),
      position: const LatLng(23.87430, 90.40012),
      icon: markerbitmap,
    ));

    markers.add(Marker(
      markerId: const MarkerId('Wari'),
      position: const LatLng(23.71954, 90.41640),
      icon: markerbitmap,
    ));

    markers.add(Marker(
      markerId: const MarkerId('Badda'),
      position: const LatLng(23.78861, 90.42480),
      icon: markerbitmap,
    ));

    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location Services Are Disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
