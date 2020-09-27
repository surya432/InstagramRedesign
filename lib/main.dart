import 'dart:collection';

import 'package:InstagramReDesign/componet/CustomPointer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Redesign',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Instagram Redesign'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<String> categoriesList = ["Recent", 'Polpular', "Trends", "People"];
List<String> contentList = [
  "https://instagram.fsub8-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p640x640/119895196_338956100642197_6380835213787581348_n.jpg?_nc_ht=instagram.fsub8-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=VjYe_CjPSjcAX_FncHr&oh=3015894c4cd6ba9cba5302905d4f46f5&oe=5F985DEE",
  "https://scontent-sin6-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/p640x640/110559772_138228441245867_1191370204022091135_n.jpg?_nc_ht=scontent-sin6-1.cdninstagram.com&_nc_cat=111&_nc_ohc=jbsO8KQWulwAX-rYIXu&oh=7322a45d0c9466e1039f5b8f3c436c07&oe=5F9B0AE1",
  "https://instagram.fsub8-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/45574725_761695124171330_5173136979241535213_n.jpg?_nc_ht=instagram.fsub8-1.fna.fbcdn.net&_nc_cat=102&_nc_ohc=wy_N3b5VTTEAX85psqv&oh=c2b8cb3f8a230fbe8ed84d83e549fe62&oe=5F9B5E56",
  "https://scontent-sin6-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/p640x640/114164305_995525564216286_8583183654313261128_n.jpg?_nc_ht=scontent-sin6-1.cdninstagram.com&_nc_cat=106&_nc_ohc=iuy-J5El-5cAX8VoOq0&oh=65b79672924be2ecf3ec90a87ba3fed6&oe=5F988045",
  "https://scontent-sin6-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/45793896_590961808004816_553617100914015713_n.jpg?_nc_ht=scontent-sin6-2.cdninstagram.com&_nc_cat=108&_nc_ohc=cseB0q_02kEAX-kjViR&oh=6d718d15420e0b590f4937ab48d979db&oe=5F997AD2",
];

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int currentIndexCategories = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  buildOntapCategories(int index) {
    setState(() {
      currentIndexCategories = index;
    });
    print(currentIndexCategories);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white.withAlpha(120),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              child: Container(
                height: size.height - 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discover",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Stack(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  size: 32,
                                ),
                                Positioned(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    maxRadius: 6,
                                  ),
                                  top: 2,
                                  right: 2,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                            onTap: () => buildOntapCategories(index),
                            child: Container(
                              margin: EdgeInsets.only(right: 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    categoriesList[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: currentIndexCategories == index
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  if (currentIndexCategories == index)
                                    Container(
                                      alignment: Alignment.topCenter,
                                      color: Colors.orange[400],
                                      width: 35,
                                      height: 4,
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this would produce 2 rows.
                          crossAxisCount: 2,
                          shrinkWrap: true, // use it
                          childAspectRatio: (size.width / (size.height - 220)),
                          // Generate 100 Widgets that display their index in the List
                          children: List.generate(contentList.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white,
                                    image: new DecorationImage(
                                      image: new NetworkImage(
                                          contentList[index].toString()),
                                      fit: BoxFit.cover,
                                    )),
                                height: 400,
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        height: 98,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 80,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: CustomPointer(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          elevation: 0.1,
                          onPressed: () {}),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: currentIndex == 0
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.search,
                                color: currentIndex == 1
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: currentIndex == 2
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.person_outline,
                                color: currentIndex == 3
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
