import 'package:flutter/material.dart';
import 'package:zooberuserapp/constants/colors.dart';

class ClaimInsurancefaqdetails extends StatefulWidget {
  const ClaimInsurancefaqdetails({super.key});

  @override
  State<ClaimInsurancefaqdetails> createState() =>
      _ClaimInsurancefaqdetailsState();
}

class _ClaimInsurancefaqdetailsState extends State<ClaimInsurancefaqdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("FAQs"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFE7ECFA),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 12,
                              backgroundColor: buttonrightcolor,
                              child: Icon(
                                Icons.question_mark_outlined,
                                color: white,
                                size: 10,
                              )),
                          Flexible(
                            child: Text(
                              "  I want to claim Insurance for a ride",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Text(
                          """We care about your safety and strive to enhance your experince with zoober. Our workers are commited to offering you a comfortable and safe ride. In case you were injured or involved in an accident during a rapido ride, you can claim isurance by visiting t insurance section of the application""",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE7ECFA),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Text("Was this article helpful ?"),
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(Icons.thumb_down_alt_outlined)
                        ],
                      ),
                      Text(""),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          const Icon(Icons.arrow_forward_ios_outlined, size: 25)
        ],
      ),
    );
  }
}
