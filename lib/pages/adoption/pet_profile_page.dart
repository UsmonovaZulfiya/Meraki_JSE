import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dto/user_request.dart';
import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';

class PetProfilePage extends StatefulWidget {
  final String petId;

  const PetProfilePage({super.key, required this.petId});

  @override
  State<PetProfilePage> createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  @override
  Widget build(BuildContext context) {
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;

    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Detail Info'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Pet>(
              future: dbService?.fetchPetByUID(widget.petId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final pet = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.network(pet?.photoURL ?? '',
                          height: 200.0, width: double.infinity),
                      ListTile(
                        title: Text(pet?.name ?? ''),
                        subtitle: Text(pet?.breed ?? ''),
                        trailing: Text(pet?.gender ?? ''),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Medical background'),
                      ),
                      Card(
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(pet?.medicalInfo ?? 'Not available'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Description'),
                      ),
                      Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(pet?.addInfo ?? 'Not available'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: FutureBuilder<List<String>>(
                          future:
                              dbService?.fetchPetAdoptionRequests(widget.petId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final userIds = snapshot.data;
                              print(userIds);
                              return ListView.builder(
                                itemCount: userIds?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return FutureBuilder<UserRequest?>(
                                    future: dbService
                                        ?.fetchUserById(userIds![index]),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        UserRequest? user = snapshot.data;
                                        return ListTile(
                                          title: Text(user!.email),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Deny button logic
                                                  // Implement deny functionality
                                                },
                                                child: Text('Deny'),
                                              ),
                                              SizedBox(width: 8),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Approve button logic
                                                  // Implement approve functionality
                                                },
                                                child: Text('Approve'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
