import 'package:flutter/material.dart';

class LesothoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information about Turkey'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Turkey',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Turkey, officially the Republic of Turkey, is a transcontinental country located mainly on the Anatolian Peninsula in Western Asia, with a smaller portion on the Balkan Peninsula in Southeastern Europe.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Geography',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Turkey is bordered by eight countries: Greece and Bulgaria to the northwest; Georgia to the northeast; Armenia, Azerbaijan, and Iran to the east; and Iraq and Syria to the south.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections and information as needed
          ],
        ),
      ),
    );
  }
}