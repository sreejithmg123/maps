import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const initialCameraPosition =
      CameraPosition(target: LatLng(25.276987, 55.296249), zoom: 11.5);
  GoogleMapController? googleMapController;
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (controllers) => googleMapController = controllers,
        onTap: _handleTap,
        markers: Set.from(markers),
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      markers = [];
      markers.add(Marker(
          markerId: MarkerId(tappedPoint.toString()), position: tappedPoint));
    });
  }
}
