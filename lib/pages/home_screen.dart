import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreenContent();
      case 1:
        return SearchScreen();
      case 2:
        return ProfileScreen();
      default:
        return HomeScreenContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Saya'),
        centerTitle: true,
      ),
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Konten halaman Beranda
class HomeScreenContent extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Hot Wheels Nissan Skyline',
      'brand': 'Hot Wheels',
      'price': 'Rp 50.000',
      'image': 'assets/images/produk/HWNissanSky.jpg',
      'description': 'Model Nissan Skyline dengan detail tinggi.'
    },
    {
      'name': 'Tomica Toyota Supra',
      'brand': 'Tomica',
      'price': 'Rp 70.000',
      'image': 'assets/images/produk/TomicaSupra.jpg',
      'description': 'Replika Toyota Supra yang sporty dan stylish.'
    },
    {
      'name': 'Matchbox Porsche 911',
      'brand': 'Matchbox',
      'price': 'Rp 60.000',
      'image': 'assets/images/produk/MatchboxPorsche.jpeg',
      'description': 'Klasik Porsche 911 dengan desain ikonik.'
    },
    {
      'name': 'Maisto Lamborghini Huracan',
      'brand': 'Maisto',
      'price': 'Rp 90.000',
      'image': 'assets/images/produk/MaistoLamborghiniHuracan.png',
      'description': 'Supercar Lamborghini dengan detail menakjubkan.'
    },
    {
      'name': 'Majorette BMW i8',
      'brand': 'Majorette',
      'price': 'Rp 75.000',
      'image': 'https://example.com/bmw_i8.jpg',
      'description': 'Mobil sport futuristik dengan desain aerodinamis.'
    },
    {
      'name': 'Bburago Ferrari 488 GTB',
      'brand': 'Bburago',
      'price': 'Rp 85.000',
      'image': 'https://example.com/ferrari_488.jpg',
      'description': 'Ferrari 488 GTB, simbol kecepatan dan kemewahan.'
    },
    {
      'name': 'Hot Wheels Batmobile',
      'brand': 'Hot Wheels',
      'price': 'Rp 55.000',
      'image': 'https://example.com/batmobile.jpg',
      'description': 'Mobil ikonik Batman yang siap untuk aksi.'
    },
    {
      'name': 'Tomica Nissan Leaf',
      'brand': 'Tomica',
      'price': 'Rp 60.000',
      'image': 'https://example.com/nissan_leaf.jpg',
      'description': 'Mobil listrik ramah lingkungan dengan desain modern.'
    },
    {
      'name': 'Maisto Ford Mustang',
      'brand': 'Maisto',
      'price': 'Rp 70.000',
      'image': 'https://example.com/ford_mustang.jpg',
      'description': 'Klasik Ford Mustang, mobil yang penuh gaya.'
    },
    {
      'name': 'Matchbox Jeep Wrangler',
      'brand': 'Matchbox',
      'price': 'Rp 55.000',
      'image': 'https://example.com/jeep_wrangler.jpg',
      'description': 'Jeep Wrangler, siap untuk petualangan di luar ruangan.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: PageView(
            children: [
              Image.network('assets/images/img4.jpg', fit: BoxFit.cover),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          color: Colors.blue[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.new_releases, size: 30, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewProductScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, size: 30, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.category, size: 30, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Jumlah kolom
              childAspectRatio: 0.9, // Rasio aspek
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(products[index]['image']!, height: 80, fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(products[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(products[index]['brand']!),
                    Text(products[index]['price']!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(products[index]['description']!, textAlign: TextAlign.center),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Halaman Produk Baru
class NewProductScreen extends StatelessWidget {
  final List<Map<String, String>> newProducts = [
    {'name': 'Hot Wheels Nissan Skyline', 'price': 'Rp 50.000', 'brand': 'Hot Wheels', 'scale': '1:64'},
    {'name': 'Tomica Toyota Supra', 'price': 'Rp 70.000', 'brand': 'Tomica', 'scale': '1:64'},
    {'name': 'Matchbox Porsche 911', 'price': 'Rp 60.000', 'brand': 'Matchbox', 'scale': '1:64'},
    {'name': 'Maisto Lamborghini Huracan', 'price': 'Rp 90.000', 'brand': 'Maisto', 'scale': '1:18'},
    {'name': 'Majorette BMW i8', 'price': 'Rp 75.000', 'brand': 'Majorette', 'scale': '1:64'},
    {'name': 'Bburago Ferrari 488 GTB', 'price': 'Rp 85.000', 'brand': 'Bburago', 'scale': '1:24'},
    {'name': 'Hot Wheels Batmobile', 'price': 'Rp 55.000', 'brand': 'Hot Wheels', 'scale': '1:64'},
    {'name': 'Tomica Nissan Leaf', 'price': 'Rp 60.000', 'brand': 'Tomica', 'scale': '1:64'},
    {'name': 'Maisto Ford Mustang', 'price': 'Rp 70.000', 'brand': 'Maisto', 'scale': '1:18'},
    {'name': 'Matchbox Jeep Wrangler', 'price': 'Rp 55.000', 'brand': 'Matchbox', 'scale': '1:64'},
    {'name': 'Tomica Suzuki Jimny', 'price': 'Rp 65.000', 'brand': 'Tomica', 'scale': '1:64'},
    {'name': 'Majorette VW Beetle', 'price': 'Rp 50.000', 'brand': 'Majorette', 'scale': '1:64'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produk Baru')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
        ),
        itemCount: newProducts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_shipping),
                Text(newProducts[index]['name']!),
                Text('Brand: ${newProducts[index]['brand']}'),
                Text('Harga: ${newProducts[index]['price']}'),
                Text('Skala: ${newProducts[index]['scale']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Halaman Keranjang Belanja
class ShoppingCartScreen extends StatelessWidget {
  final List<Map<String, String>> cartItems = [
    {'name': 'Hot Wheels Nissan GTR', 'price': 'Rp 55.000', 'brand': 'Hot Wheels', 'scale': '1:64'},
    {'name': 'Tomica Honda Civic', 'price': 'Rp 65.000', 'brand': 'Tomica', 'scale': '1:64'},
    {'name': 'Maisto Ford Mustang', 'price': 'Rp 70.000', 'brand': 'Maisto', 'scale': '1:18'},
    {'name': 'Matchbox Land Rover Defender', 'price': 'Rp 75.000', 'brand': 'Matchbox', 'scale': '1:64'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang Belanja')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag),
                Text(cartItems[index]['name']!),
                Text('Brand: ${cartItems[index]['brand']}'),
                Text('Harga: ${cartItems[index]['price']}'),
                Text('Skala: ${cartItems[index]['scale']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Halaman Kategori
class CategoryScreen extends StatelessWidget {
  final List<String> categories = ['Mobil', 'Motor', 'Truk', 'Bus'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kategori')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            leading: Icon(Icons.category),
            onTap: () {
              // Aksi saat kategori dipilih
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih kategori: ${categories[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
