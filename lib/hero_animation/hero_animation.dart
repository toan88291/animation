import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class HeroAnimation extends StatefulWidget {
  static const ROUTE_NAME = 'HeroAnimation';
  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  static const TAG = 'HeroAnimation';

  List data = [
    {
      'name': 'Antelope Canyon',
      'image':
      'https://images.unsplash.com/photo-1527498913931-c302284a62af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
      'description':
      'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
      'date': 'Mar 20, 2019',
      'rating': '4.7',
      'cost': '\$40.00'
    },
    {
      'name': 'Genteng Lembang',
      'image':
      'https://images.unsplash.com/photo-1548560781-a7a07d9d33db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=581&q=80',
      'description':
      'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
      'date': 'Mar 24, 2019',
      'rating': '4,83',
      'cost': '\$50.00'
    },
    {
      'name': 'Kamchatka Peninsula',
      'image':
      'https://images.unsplash.com/photo-1542869781-a272dedbc93e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=983&q=80',
      'description':
      'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
      'date': 'Apr 18, 2019',
      'rating': '4,7',
      'cost': '\$30.00'
    },
  ];

  var profileImage =
      'https://www.imgmodels.com/sites/default/files/283adc16-7317-4189-bf7f-816367d68adf.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Search for place',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Destination',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0)),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        )
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                )
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.map((datas) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen(datas)));
                      },
                      child: Hero(
                        tag: datas['image'],
                        child: Container(
                          height: 200.0,
                          width: 140.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black26, BlendMode.darken),
                                  image: NetworkImage(datas['image']),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(),
                                    Text(
                                      '4,7',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  datas['name'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Text(
                                  datas['date'],
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(height: 8.0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'VIEW ALL -',
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(height: 32.0),
          Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Container(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('New', style: TextStyle(fontSize: 22.0)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Recomended', style: TextStyle(fontSize: 22.0)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Saved', style: TextStyle(fontSize: 22.0)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Container(
              height: 2.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.black12,
                    height: 2.0,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.red,
                    height: 2.0,
                    width: 80.0,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              height: 256.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      itemCard(data[0]['image'], data[0]['name'],
                          data[0]['date'], 120.0, context),
                      SizedBox(height: 16.0),
                      itemCard(data[1]['image'], data[1]['name'],
                          data[1]['date'], 120.0, context),
                    ],
                  ),
                  itemCard(data[2]['image'], data[2]['name'], data[2]['date'],
                      256.0, context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemCard(image, title, date, height, context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width / 2 - 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              date,
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final data;
  SecondScreen(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                tag: data['image'],
                child: Image.network(
                  data['image'],
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black54,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                          Text(
                            '02/10',
                            style: TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 240.0,
                        child: Text(
                          data['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                              fontSize: 42.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '4,7',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '(1072)',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        child: Text(
                          data['description'],
                          style: TextStyle(color: Colors.white54, height: 1.4),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'READ MORE',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 4.0,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                  SizedBox(width: 4.0),
                                  Container(
                                    width: 18.0,
                                    height: 2.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4.0),
                                  Container(
                                    width: 4.0,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                  SizedBox(width: 4.0),
                                  Container(
                                    width: 4.0,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                ],
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '\$40.00',
                                style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                              ),
                              Text(
                                'Fri, March 2019',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 14.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}