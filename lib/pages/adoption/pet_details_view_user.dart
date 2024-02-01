import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PetProfilePageView extends StatefulWidget {
  final String petId;


  const PetProfilePageView({Key? key, required this.petId}) : super(key: key);

  @override
  State<PetProfilePageView> createState() => _PetProfilePageViewState();
}

class _PetProfilePageViewState extends State<PetProfilePageView> {
  bool isRequestSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Detail Info'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('pets').doc(widget.petId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data?.exists ?? false) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: <Widget>[
                  Image.network(data['photo'], height: 200.0, width: double.infinity),
                  ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['breed']),
                    trailing: Text(data['gender']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Medical background'),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(data['medical_info'] ?? 'Not available'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Description'),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(data['additional_info'] ?? 'Not available'),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isRequestSent ? null : () {
                      setState(() {
                        isRequestSent = true;
                      });
                      // Add logic to handle the adoption request here
                    },
                    child: Text(isRequestSent ? 'Request Sent' : 'Adopt'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // set the size
                    ),
                  ),
                ],
              );
            } else {
              return Text("Pet not found");
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}