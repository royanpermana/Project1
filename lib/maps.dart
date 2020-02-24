import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  var latitude;
  var longitude;

  MapPage({this.latitude, this.longitude});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _controller;

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("home"),
          position: LatLng(widget.latitude, widget.longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: "Current Location")),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOCATION'),
        ),
        body: mapWidget());
  }

  Widget mapWidget() {
    return SafeArea(
      child: GoogleMap(
        markers: _createMarker(),
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 15,
            bearing: 15.0),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
