import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> relatedImages;

  DetailPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.relatedImages,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Images'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDescriptionTab(),
            _buildImagesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: title,
              child: Image.asset(imagePath),
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8,
      ),
      itemCount: relatedImages.length,
      itemBuilder: (context, index) {
        return Image.asset(relatedImages[index]);
      },
    );
  }
}
