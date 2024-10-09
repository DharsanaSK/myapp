import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  final String placeName;

  ReviewsPage({required this.placeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for $placeName'),
        backgroundColor: const Color.fromARGB(255, 103, 198, 243),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildReviewItem('Saravanan', 5, 'Amazing place!',
              'lib/images/user1.jpg', 'June 24, 2024'),
          _buildReviewItem('Kamalam', 4, 'Very beautiful and serene.',
              'lib/images/user2.jpg', 'June 20, 2024'),
          _buildReviewItem('Logith', 3, 'Good & better.',
              'lib/images/user3.jpg', 'June 18, 2024'),
          // Add more reviews here
        ],
      ),
    );
  }

  Widget _buildReviewItem(String reviewer, int rating, String comment,
      String profilePicture, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profilePicture),
                  radius: 20.0,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewer,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: List.generate(
                    rating,
                    (index) => Icon(Icons.star, color: Colors.amber),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(comment),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  onPressed: () {
                    // Implement like functionality
                  },
                ),
                Text('Like', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
