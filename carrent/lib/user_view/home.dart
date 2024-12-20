import 'package:flutter/material.dart';
import 'package:carrent/user_view/car_detail_screen.dart';
import 'package:carrent/user_view/search.dart';
import 'package:carrent/user_view/setting.dart';
import 'package:carrent/user_view/wishlist.dart'; // Import WishlistScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the list of screens
  final List<Widget> _screens = [
    const HomeContent(),
    const Search(),
     Menu(), // Settings screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('FleetRider')),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> cars = [
    {
      'image': 'assets/images/w.webp',
      'name': 'Mercedes-Benz C-Class',
      'price': '₹40,00,000',
      'brandname': 'Mercedes',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/a.webp',
      'name': 'Mahindra XUV700',
      'price': '₹8,00,000',
      'brandname': 'Mahindra',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/b.webp',
      'name': 'Hyundai i20',
      'price': '₹10,50,000',
      'brandname': 'Hyundai',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/3.jpg',
      'name': 'Ford EcoSport',
      'price': '₹12,00,000',
      'brandname': 'Ford',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/4.jpg',
      'name': 'Datsun Redi-Go',
      'price': '₹6,00,000',
      'brandname': 'Datsun',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/5.jpg',
      'name': 'Mercedes-Benz C-Class',
      'price': '₹40,00,000',
      'brandname': 'Mercedes',
      'isWishlisted': false,
    },
    {
      'image': 'assets/images/q.jpg',
      'name': 'Mercedes-Benz C-Class',
      'price': '₹40,00,000',
      'brandname': 'Mercedes',
      'isWishlisted': false,
    },
  ];

  List<Map<String, dynamic>> filteredCars = [];
  List<Map<String, dynamic>> wishlist =
      []; // Wishlist list to hold favorited cars

  @override
  void initState() {
    super.initState();
    filteredCars = cars;
  }

  void _filterCars(String query) {
    setState(() {
      filteredCars = cars.where((car) {
        final name = car['name']!.toLowerCase();
        final brand = car['brandname']!.toLowerCase();
        final searchQuery = query.toLowerCase();
        return name.contains(searchQuery) || brand.contains(searchQuery);
      }).toList();
    });
  }

  void _toggleWishlist(Map<String, dynamic> car) {
    setState(() {
      car['isWishlisted'] = !car['isWishlisted'];
      if (car['isWishlisted']) {
        wishlist.add(car); // Add to wishlist
      } else {
        wishlist.remove(car); // Remove from wishlist
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by name or brand',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: _filterCars,
          ),
          const SizedBox(height: 20),
          Text(
            'Cars',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildCarCard(
                    context,
                    filteredCars[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(BuildContext context, Map<String, dynamic> car) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetail(
              image: car['image']!,
              name: car['name']!,
              price: car['price']!,
              brandName: car['brandname']!,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  car['image']!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${car['name']} (${car['brandname']})',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        car['price']!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    car['isWishlisted']
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: car['isWishlisted'] ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => _toggleWishlist(car),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> wishlist = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        backgroundColor: theme.primaryColor,
      ),
      body: wishlist.isEmpty
          ? const Center(child: Text('No cars in the wishlist'))
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final car = wishlist[index];
                return _buildCarCard(context, car);
              },
            ),
    );
  }

  Widget _buildCarCard(BuildContext context, Map<String, dynamic> car) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetail(
              image: car['image']!,
              name: car['name']!,
              price: car['price']!,
              brandName: car['brandname']!,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  car['image']!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${car['name']} (${car['brandname']})',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        car['price']!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarDetail extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String brandName;

  const CarDetail({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Image.asset(image),
          Text(name),
          Text(brandName),
          Text(price),
        ],
      ),
    );
  }
}
