import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Mini GT Nissan GT-R R35',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 400.000',
      'icon': Icons.directions_car,
      'brand': 'Mini GT',
      'image': 'assets/images/img4.jpg',
      'isFavorite': false
    },
    {
      'name': 'Tarmac Works BMW M3 E30',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 350.000',
      'icon': Icons.directions_car,
      'brand': 'Tarmac',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Tomica Limited Edition Mazda RX-7',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 300.000',
      'icon': Icons.directions_car,
      'brand': 'Tomica Limited Edition',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Star Model Ford Mustang',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 250.000',
      'icon': Icons.directions_car,
      'brand': 'Star Model',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Mini GT Toyota Supra',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 450.000',
      'icon': Icons.directions_car,
      'brand': 'Mini GT',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Hot Wheels Lamborghini Huracan',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 500.000',
      'icon': Icons.directions_car,
      'brand': 'Hot Wheels',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Majorette Mercedes-Benz G-Class',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 350.000',
      'icon': Icons.directions_car,
      'brand': 'Majorette',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Dinky Toys Aston Martin DB5',
      'description': 'Diecast Model Car 1:43',
      'price': 'Rp 600.000',
      'icon': Icons.directions_car,
      'brand': 'Dinky Toys',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'AutoArt Porsche 911 GT3',
      'description': 'Diecast Model Car 1:18',
      'price': 'Rp 1.200.000',
      'icon': Icons.directions_car,
      'brand': 'AutoArt',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Norev Citroën 2CV',
      'description': 'Diecast Model Car 1:43',
      'price': 'Rp 300.000',
      'icon': Icons.directions_car,
      'brand': 'Norev',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Greenlight Hollywood Dodge Charger',
      'description': 'Diecast Model Car 1:64',
      'price': 'Rp 400.000',
      'icon': Icons.directions_car,
      'brand': 'Greenlight',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Bburago Ferrari 488 GTB',
      'description': 'Diecast Model Car 1:18',
      'price': 'Rp 900.000',
      'icon': Icons.directions_car,
      'brand': 'Bburago',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    {
      'name': 'Corgi Vanguards Jaguar E-Type',
      'description': 'Diecast Model Car 1:43',
      'price': 'Rp 400.000',
      'icon': Icons.directions_car,
      'brand': 'Corgi',
      'image': 'https://via.placeholder.com/150',
      'isFavorite': false
    },
    // Add more products as needed
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return product['name'].toLowerCase().contains(query.toLowerCase()) ||
            product['brand'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Cari Produk atau Brand',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(filteredProducts[index]['image'], width: 40, fit: BoxFit.cover),
                title: Text(filteredProducts[index]['name']),
                subtitle: Text('${filteredProducts[index]['description']} - ${filteredProducts[index]['price']} (${filteredProducts[index]['brand']})'),
                trailing: IconButton(
                  icon: Icon(
                    filteredProducts[index]['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                    color: filteredProducts[index]['isFavorite'] ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      filteredProducts[index]['isFavorite'] = !filteredProducts[index]['isFavorite'];
                    });
                  },
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Anda memilih ${filteredProducts[index]['name']} dari brand ${filteredProducts[index]['brand']}')),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
