import 'package:flutter/material.dart';
import 'package:zooberuserapp/constants/colors.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

class NewFavourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Map View
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.map, size: 100, color: Colors.grey),
              ),
            ),
          ),
          // Add to Favourites Section
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add to favourites",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("Search"),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Search Field
                  const Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.trip_origin_outlined,
                                size: 16, color: Colors.white),
                          ),
                          title: Text(
                            "Plot No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text("Lorem ipsum dolor sit amet, consectetur"),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "SAVE LOCATION AS",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),

                  Wrap(
                    spacing: 10.0,
                    children: [
                      _buildLocationButton("🏠 Home", true, Icons.home),
                      _buildLocationButton(
                          "💼 Work", false, Icons.work_outline_sharp),
                      _buildLocationButton(
                          "💪 Gym", false, Icons.fitness_center_outlined),
                      _buildLocationButton("🎓 College", false, Icons.school),
                      _buildLocationButton("🏨 Hostel", false, Icons.business),
                      _buildLocationButton(
                          "😊 Others", false, Icons.catching_pokemon_sharp),
                    ],
                  ),
                  const Spacer(),
                  // Add to Favourite Button
                  const SizedBox(
                      width: double.infinity,
                      child: custombutton(text: "Add to favourite")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton(String label, bool isSelected, IconData icon) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? buttonrightcolor : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(label),
    );
  }
}
