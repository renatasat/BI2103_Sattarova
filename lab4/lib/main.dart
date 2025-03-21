import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;
  int favoriteCount = 14;

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        isFavorite = false;
        favoriteCount = favoriteCount - 1;
      } else {
        isFavorite = true;
        favoriteCount = favoriteCount + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Греция"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Раздел с картинкой
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  "https://avatars.mds.yandex.net/get-entity_search/2302423/1132269988/orig",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  color: Colors.lime,
                  child: Text(
                    "Популярные виды",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
            // Раздел с информацией
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Достопримечательности Греции",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Страна с богатой историей и культурой",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  // Кнопка избранного
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red),
                        onPressed: toggleFavorite,
                      ),
                      Text(
                        "$favoriteCount",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Раздел с кнопками действий
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(Icons.info, "Информация", () {
                    print("Информация");
                  }),
                  buildButton(Icons.photo, "Галерея", () {
                    print("Галерея");
                  }),
                  buildButton(Icons.share, "Поделиться", () {
                    print("Поделиться");
                  }),
                ],
              ),
            ),
            // Раздел с описанием
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Греция известна своими историческими памятниками, красивыми пляжами и вкусной кухней. Здесь вы найдете множество достопримечательностей, таких как Акрополь в Афинах, острова Санторини и Миконос, а также великолепные пляжи Крит и Родос. Каждый год миллионы туристов посещают Грецию, чтобы насладиться её культурой, архитектурой и замечательной местной кухней, включая знаменитую греческую салат и мезе. Убедитесь, что вы попробовали местные вина и оливки! Греция — это не просто страна, это впечатляющее путешествие в историю.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.blue, size: 30),
          onPressed: onPressed,
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}