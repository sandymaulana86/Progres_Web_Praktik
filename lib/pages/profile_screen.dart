import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('assets/images/SANDY.JPG'),
            ),
            SizedBox(height: 20),
            Text(
              'Sandy Maulana Rifqi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Software Engineer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi edit profil di sini
              },
              child: Text('Edit Profil'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Informasi Akun'),
                    subtitle: Text('Informasi akun pengguna'),
                  ),
                  ListTile(
                    title: Text('Pengaturan'),
                    subtitle: Text('Pengaturan aplikasi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}