import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'turkey.dart' as turkeyPage;
import 'lesotho.dart' as lesothoPage;
import 'london.dart' as londonPage;
import 'phillipi.dart' as phillipiPage;
import 'uganda.dart' as ugandaPage;
import 'local_outreach.dart' as localPage;
//import 'package:google_fonts/google_fonts.dart';

/// Main function that runs the app.
// John 1:1-5 "In the beginning was the Word, and the Word was with God, and the Word was God.
// He was with God in the beginning. Through Him all things were made. Without Him, nothing was made that has been made.
// In Him was life, and that life was the light of all mankind. The light shines in the darkness and the darness has not overcome it."
void main() {
  runApp(MyApp());
}

/// MyApp is the root widget of the app. It's the top level widget of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Every app has a build widget.
  @override
  Widget build(BuildContext context) {
    //This is what the widget contains.
    return ChangeNotifierProvider(
      //Creates a state for the whole app.
      create: (context) => MyAppState(),
      child: MaterialApp( //Material App means there are themes within the app.
        title: 'Outreach Touch', //Name of app.
        theme: ThemeData(
          useMaterial3: true, //Buttons look a certain way because of this.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// Basically says, "I have changed and anyone that is listening to me should take note".
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favourites = <WordPair>[];

  void update() {
    current = WordPair.random();
    notifyListeners();
  }
}

// ...
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = OutreachMaterial();
      case 2:
        page = MissionsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row( //Row that covers entire screen.
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false, //Toggles the extended view of the navigation rail.
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_book),
                  label: Text('Material'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.flight),
                  label: Text('Missions'),
                ),
              ],
              selectedIndex: selectedIndex, //Defaults to the first navigation button (home icon selected now by default).
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded( //Expanded grabs as much space as possible.
            child: Container(
              //Background colour of page.
              color: Colors.lightBlue[50],
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favourites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.update();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OutreachMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

class MissionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 20), // Optional padding if needed
        child: Wrap(
          spacing: 30,
          runSpacing: 20,
          alignment: WrapAlignment.start,
          children: [
            _buildMissionCard(
              id: 1,
              color: Color.fromARGB(255, 146, 54, 31),
              imagePath: 'assets/images/turkey_image.jpg',
              title: "Turkey",
              textColor: Color.fromARGB(255, 255, 137, 27),
              context: context,
            ),
            _buildMissionCard(
              id: 2,
              color: Color.fromARGB(255, 8, 108, 155),
              imagePath: 'assets/images/london_image.jpg',
              title: "London",
              textColor: Color.fromARGB(255, 207, 223, 238),
              context: context,
            ),
            _buildMissionCard(
              id: 3,
              color: Color.fromARGB(195, 255, 235, 120),
              imagePath: 'assets/images/uganda_image.jpg',
              title: "Uganda",
              textColor: Color.fromARGB(255, 196, 11, 11),
              context: context,
            ),
            _buildMissionCard(
              id: 4,
              color: Color.fromARGB(136, 203, 255, 196),
              imagePath: 'assets/images/lesotho_image.jpg',
              title: "Lesotho",
              textColor: Color.fromARGB(255, 38, 133, 25),
              context: context,
            ),
            _buildMissionCard(
              id: 5,
              color: Color.fromARGB(255, 248, 197, 138),
              imagePath: 'assets/images/local_image.jpg',
              title: "Local Outreach",
              textColor: Color.fromARGB(255, 131, 98, 55),
              context: context,
            ),
            _buildMissionCard(
              id: 6,
              color: Color.fromARGB(246, 240, 126, 179),
              imagePath: 'assets/images/phillipi_image.jpeg',
              title: "Phillipi",
              textColor: Color.fromARGB(255, 75, 33, 104),
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionCard({
    required int id,
    required Color color,
    required String imagePath,
    required String title,
    required Color textColor,
    required BuildContext context,
  }) {
    return Material(
      color: color,
      elevation: 8,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.black26,
        onTap: () {
          switch(id) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => turkeyPage.TurkeyPage()),
              );
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => londonPage.LondonPage()),
              );
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ugandaPage.UgandaPage()),
              );
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lesothoPage.LesothoPage()),
              );
            case 5:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => localPage.LocalPage()),
              );
            case 6:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => phillipiPage.PhillipiPage()),
              );
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(
              image: AssetImage(imagePath),
              width: 280,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ...
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); //This theme goes all the way to the top and adjusts according to the top theme.
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asPascalCase, 
        style: style,
        semanticsLabel: pair.asPascalCase, //This is for screen readers.
        ),
      ),
    );
  }
}