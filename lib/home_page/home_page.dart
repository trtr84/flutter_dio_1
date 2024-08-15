import 'package:flutter/material.dart';
import 'package:flutter_dio_1/data/photos_data.dart';
import 'package:flutter_dio_1/models/photos_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Photos>> _futureUsers;
  @override
  void initState() {
    super.initState();
    _futureUsers = PhotosData().getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // List<Users> users = snapshot.data!;
            List<Photos> photos = snapshot.data!;
            return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  Photos photo = photos[index];
                  return ListTile(
                    leading: Image.network(
                      photo.url,
                      width: 20,
                      height: 30,
                    ),
                    title: Text(
                      photo.title,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      // style: const TextStyle(fontFamily: 'Roboto'),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
