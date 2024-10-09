import 'package:flutter/material.dart';
import 'package:myapp/pages/detailpage.dart';
import 'package:myapp/pages/reviewspage.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<String> popularPlaceImages = [
    'lib/images/tpk.png',
    'lib/images/periyar.png',
    'lib/images/vaigaidam.jpg',
    'lib/images/meenakshi.jpg',
    'lib/images/alagarkovil.jpg',
  ];

  final List<String> popularPlaceNames = [
    'Tiruparankundram',
    'Periyar',
    'Vaigai Dam',
    'Meenakshi',
    'Alagar kovil',
  ];

  final List<String> explorePlaceImages = [
    'lib/images/nayakarmahal.jpg',
    'lib/images/KODAIKANAL.jpg',
    'lib/images/Munnar.jpg',
    'lib/images/kanyakumari.jpg',
    'lib/images/rameswaram.jpg',
    'lib/images/ramnad.jpg',
  ];

  final List<String> explorePlaceNames = [
    'Nayakar Mahal',
    'Kodaikanal',
    'Munnar',
    'Kanyakumari',
    'Rameswaram',
    'Ramnad',
  ];

  final Map<String, String> placeDescriptions = {
    'Tiruparankundram': 'This is a detailed description of Tiruparankundram...',
    'Periyar': 'This is a detailed description of Periyar...',
    'Vaigai Dam': 'This is a detailed description of Vaigai Dam...',
    'Meenakshi': 'This is a detailed description of Meenakshi...',
    'Alagar kovil': 'This is a detailed description of Alagar kovil...',
    'Nayakar Mahal': 'This is a detailed description of Nayakar Mahal...',
    'Kodaikanal':
        'Kodaikanal, often referred to as the "Princess of Hill Stations", is nestled in the Western Ghats of Tamil Nadu...',
    'Munnar':
        'Munnar, often dubbed as the "Kashmir of South India", is a picturesque hill station in Kerala\'s Western Ghats....',
    'Kanyakumari': 'This is a detailed description of Explore Place 4...',
    'Rameswaram': 'This is a detailed description of Explore Place 5...',
    'Ramnad': 'This is a detailed description of Explore Place 6...',
  };

  final Map<String, List<String>> relatedImages = {
    'Tiruparankundram': ['lib/images/tpk1.jpg', 'lib/images/tpk2.jpg'],
    'Periyar': ['lib/images/periyar1.jpg', 'lib/images/periyar2.jpg'],
    'Vaigai Dam': ['lib/images/vaigai1.jpg', 'lib/images/vaigai2.jpg'],
    'Meenakshi': ['lib/images/meenakshi1.jpg', 'lib/images/meenakshi2.jpg'],
    'Alagar kovil': ['lib/images/alagar1.jpg', 'lib/images/alagar2.jpg'],
    'Nayakar Mahal': ['lib/images/nayakar1.jpg', 'lib/images/nayakar2.jpg'],
    'Kodaikanal': [
      'lib/images/kodaikanal_lake.jpg',
      'lib/images/Dolphin_Nose.jpg'
    ],
    'Munnar': [
      'lib/images/Echo_Point.jpg',
      'lib/images/Atukkad_waterfalls.jpg'
    ],
    'Kanyakumari': [
      'lib/images/thiruvalluvar.jpg',
      'lib/images/gandhimandapam.jpg'
    ],
    'Rameswaram': ['lib/images/related19.jpg', 'lib/images/related20.jpg'],
    'Ramnad': ['lib/images/related21.jpg', 'lib/images/related22.jpg'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 103, 198, 243),
        elevation: 5.0,
        shadowColor: Color.fromARGB(255, 100, 219, 255),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[800]),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search places...',
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // Popular places
              Text(
                'Places Near you!!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10.0),
              // Horizontal ListView for popular places
              Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularPlaceImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: _buildImageItem(
                        popularPlaceImages[index],
                        popularPlaceNames[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              // Explore subtitle
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10.0),
              // GridView for explore places
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.65,
                ),
                itemCount: explorePlaceImages.length,
                itemBuilder: (context, index) {
                  return _buildImageItem(
                    explorePlaceImages[index],
                    explorePlaceNames[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageItem(String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imagePath: imagePath,
              title: title,
              description: placeDescriptions[title] ?? '',
              relatedImages: relatedImages[title] ?? [],
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: title,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsPage(placeName: title),
                ),
              );
            },
            child: Text('Reviews'),
          ),
        ],
      ),
    );
  }
}
