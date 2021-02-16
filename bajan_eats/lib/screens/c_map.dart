import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Firestore _firestore = Firestore.instance;
Map<MarkerId, Marker> chefettemarkers = <MarkerId, Marker>{};
//Map<MarkerId, Marker> kfcmarkers = <MarkerId, Marker>{};
//Map<MarkerId, Marker> bkmarkers = <MarkerId, Marker>{};
//Map<MarkerId, Marker> ukmarkers = <MarkerId, Marker>{};
//Map<MarkerId, Marker> mmMarkers = <MarkerId, Marker>{};
Completer<GoogleMapController> _controller = Completer();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGoogleMapC(),
    );
  }
}

class MyGoogleMapC extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
  
}

class _MyGoogleMapState extends State<MyGoogleMapC> {
  var currentLocation;
  var markerlist = [];
  bool mapToggle = false;
  GoogleMapController mapController;

  void initState() {
    super.initState();
    generateChefetteMarkers();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle =true;
      });
    });
  }

  generateChefetteMarkers() {
    markerlist = [];
    _firestore.collection('chefette_markers').getDocuments().then((docs) {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i < docs.documents.length; i++) {
          markerlist.add(docs.documents[i].data);
          initChefetteMarkers(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  initChefetteMarkers(mrker, mID) {
    var markerIdVal = mID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrker['Position'].latitude, mrker['Position'].longitude),
      infoWindow: InfoWindow(
        title: mrker['Name'],
        snippet: mrker['Address'],
      ),
      icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      chefettemarkers[markerId] = marker;
    });
  }

  /*generateKFCMarkers() {
    markerlist = [];
    _firestore.collection('kfc_markers').getDocuments().then((docs) {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i < docs.documents.length; i++) {
          markerlist.add(docs.documents[i].data);
          initKFCMarker(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  initKFCMarker(mrker, mID) {
    var markerIdVal = mID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrker['Position'].latitude, mrker['Position'].longitude),
      infoWindow: InfoWindow(
        title: mrker['Name'],
        snippet: mrker['Address'],
      ),
      icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      kfcmarkers[markerId] = marker;
    });
  }

  generateBKMarkers() {
    markerlist = [];
    _firestore.collection('bk_markers').getDocuments().then((docs) {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i < docs.documents.length; i++) {
          markerlist.add(docs.documents[i].data);
          initBKMarkers(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  initBKMarkers(mrker, mID) {
    var markerIdVal = mID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrker['Position'].latitude, mrker['Position'].longitude),
      infoWindow: InfoWindow(
        title: mrker['Name'],
        snippet: mrker['Address'],
      ),
      icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      bkmarkers[markerId] = marker;
    });
  }

  generateUKMarkers() {
    markerlist = [];
    _firestore.collection('uk_markers').getDocuments().then((docs) {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i < docs.documents.length; i++) {
          markerlist.add(docs.documents[i].data);
          initUKMarkers(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  initUKMarkers(mrker, mID) {
    var markerIdVal = mID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrker['Position'].latitude, mrker['Position'].longitude),
      infoWindow: InfoWindow(
        title: mrker['Name'],
        snippet: mrker['Address'],
      ),
      icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      ukmarkers[markerId] = marker;
    });
  }

  generateMMMarker() {
    markerlist = [];
    _firestore.collection('chefette_markers').getDocuments().then((docs) {
      if(docs.documents.isNotEmpty) {
        for(int i = 0; i < docs.documents.length; i++) {
          markerlist.add(docs.documents[i].data);
          initMMMarker(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  initMMMarker(mrker, mID) {
    var markerIdVal = mID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrker['Position'].latitude, mrker['Position'].longitude),
      infoWindow: InfoWindow(
        title: mrker['Name'],
        snippet: mrker['Address'],
      ),
      icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      mmMarkers[markerId] = marker;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        compassEnabled: true,
        markers: Set<Marker>.of(chefettemarkers.values),
        initialCameraPosition: CameraPosition(
          target: LatLng(13.182397, -59.570285),
          zoom: 11.5,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        //onTap: generateMarker(),
      )
    );
  }
}
