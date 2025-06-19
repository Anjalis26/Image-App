import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSwitcherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageSwitcherScreen extends StatefulWidget {
  @override
  _ImageSwitcherScreenState createState() => _ImageSwitcherScreenState();
}

class _ImageSwitcherScreenState extends State<ImageSwitcherScreen> {
  String? currentImageType; // 'asset' or 'network'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Generator'),backgroundColor: Colors.cyan,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (currentImageType == 'asset') _buildAssetImage(),
            if (currentImageType == 'network') _buildNetworkImage(),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => currentImageType = 'asset'),
                  child: Text('Generate Asset Image'),
                ),

              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(
              onPressed: () => setState(() => currentImageType = 'network'),
              child: Text('Generate Network Image'),
            ),
    ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Asset Image',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 16),
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
            ],
            image: DecorationImage(
              image: AssetImage('images/hridaan.jpeg'), // Replace with your image
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNetworkImage() {
    final imageUrl = 'https://picsum.photos/250?image=9';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Network Image',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 16),
        Container(
          width: 300,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: Text(
                  'Failed to load image',
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
