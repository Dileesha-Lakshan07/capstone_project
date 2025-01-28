import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:chat/google_map/locations.dart' as locations;

class GpsPage  extends StatefulWidget {
  const GpsPage ({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  final Map<String, Marker> _markers = {};
  List<locations.Office> _allOffices = [];
  bool _isSearching = false;
  String _searchQuery = '';
  bool _noLocationsFound = false; // Added to track if no locations were found

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    _allOffices = googleOffices.offices;
    _updateMarkers();
  }

  void _updateMarkers() {
    setState(() {
      _markers.clear();
      _noLocationsFound = true; // Assume no locations found initially

      for (final office in _allOffices) {
        if (_searchQuery.isEmpty ||
            office.name.toLowerCase().contains(_searchQuery.toLowerCase())) {
          final marker = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lng),
            infoWindow: InfoWindow(
              title: office.name,
              snippet: office.address,
            ),
          );
          _markers[office.name] = marker;
          _noLocationsFound = false; // Location found, reset the flag
        }
      }
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchQuery = '';
      _updateMarkers();
    });
  }

  void _handleSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _updateMarkers();
    });
  }

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search Google Offices...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: _handleSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: _stopSearch,
          color: Colors.white,
        ),
      ];
    }
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
        color: Colors.white,
      ),
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          // Add more actions here
        },
        color: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : const Text('Track My Pet'),
        elevation: 0, // Remove shadow
       backgroundColor: const Color(0xffFFB03E),
        centerTitle: true, // Center the title
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white, // Title color
        ),
        actions: _buildActions(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ), // Rounded corners at the bottom
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 2,
            ),
            markers: _markers.values.toSet(),
          ),
          if (_noLocationsFound) // Show this message if no locations found
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white70,
                child: const Text(
                  'No locations found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
