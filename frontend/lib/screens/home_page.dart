import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Initial map position (example: New York)
//   final CameraPosition _initialPosition = const CameraPosition(
//     target: LatLng(40.7128, -74.0060),
//     zoom: 14,
//   );

//   late GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 1️⃣ Google Map takes full screen
//           GoogleMap(
//             initialCameraPosition: _initialPosition,
//             onMapCreated: (controller) {
//               _mapController = controller;
//             },
//             myLocationEnabled: true, // shows user's blue dot
//             myLocationButtonEnabled: true, // default recenter button
//           ),

//           // 2️⃣ Welcome Card in the top-left corner
//           Positioned(
//             top: 40,
//             left: 20,
//             child: Card(
//               elevation: 5,
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     Text(
//                       'Welcome, user!',
//                       style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Text('Explore the city with ease'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 14,
  );

  late GoogleMapController _mapController;

  // Sample list of nearby places
  final List<Map<String, String>> nearbyPlaces = [
    {"name": "Central Park", "image": "https://picsum.photos/50/50?random=1"},
    {"name": "Statue of Liberty", "image": "https://picsum.photos/50/50?random=2"},
    {"name": "Times Square", "image": "https://picsum.photos/50/50?random=3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1️⃣ Google Map
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // 2️⃣ Welcome Card
          Positioned(
            top: 40,
            left: 20,
            child: Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Welcome, user!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Explore the city with ease'),
                  ],
                ),
              ),
            ),
          ),

          // 3️⃣ Bottom Panel
          DraggableScrollableSheet(
            initialChildSize: 0.25, // start at 25% of screen height
            minChildSize: 0.1, // can shrink to 10%
            maxChildSize: 0.8, // can expand to 80%
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2)
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: const Color.fromARGB(255, 89, 46, 207))),
                        elevation: 5,
                        surfaceTintColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Your daily location:", style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 63, 26, 165))),
                              SizedBox(height: 10),
                              Card(
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12)),
                                elevation: 2,
                                surfaceTintColor: const Color.fromARGB(255, 57, 166, 255),
                                child: SizedBox(
                                  height: 90,
                                  child: Align( alignment: Alignment.center,
                                    child: Text( "Parcul Central", style: TextStyle( fontSize: 24, 
                                                fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 57, 157))))
                                )
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 56, 164, 59),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () {
                                  // Handle "Begin your journey"
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min, 
                                  children: [
                                    Icon(
                                      Icons.arrow_forward, // or arrow_drop_down, arrow_right, etc.
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Begin your journey", style: 
                                      TextStyle( fontSize: 18, color: Colors.white, 
                                      fontWeight: FontWeight.bold)
                                    )
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Section Title
                      const Text(
                        "Discover places close to you",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),

                      // List of nearby places
                      Column(
                        children: nearbyPlaces.map((place) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  place['image']!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(place['name']!),
                              onTap: () {
                                // Handle tapping a nearby place
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
