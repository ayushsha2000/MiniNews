import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:gesture_detector/mainpage/details.dart';
import 'package:gesture_detector/mainpage/information.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ignore: deprecated_member_use
  static List<News> _news = List<News>();
  // ignore: deprecated_member_use
  static List<News> _newsInApp = List<News>();
  Future<List<News>> comingNews() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2bbcb6a0bf6c4c61b876a09e8250d6f9';
    var response = await http.get(Uri.parse(url));
    // ignore: deprecated_member_use
    var news = List<News>();

    var notesJson = json.decode(response.body);
    if (notesJson['status'] == 'ok') {
      notesJson["articles"].forEach((element) {
        news.add(News.fromJson(element));
      });
    }

    return news;
  }

  @override
  void initState() {
    comingNews().then((value) => setState(() {
          _news.addAll(value);
          _newsInApp = _news;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _listItem(index);
      },
      itemCount: _newsInApp.length,
    );
  }

  _listItem(index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF039BE5), Color(0xFF01579B)],
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  _newsInApp[index].title,
                  style: TextStyle(fontSize: 20),
                )),
                IconButton(
                    onPressed: () {
                      Navigator.push(this.context,
                          MaterialPageRoute(builder: (context) {
                        return MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: Scaffold(
                            backgroundColor: Color(0xFF81D4FA),
                            appBar: AppBar(
                              elevation: 0,
                              backgroundColor: Color(0xFF81D4FA),
                              centerTitle: true,
                              leading: IconButton(
                                icon: Icon(Icons.arrow_back_ios_new_sharp),
                                color: Color(0xFF039BE5),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              title: Text(
                                _newsInApp[index].title,
                                style: TextStyle(color: Color(0xFF01579B)),
                              ),
                            ),
                            body: ListView(
                              children: <Widget>[
                                Container(
                                  child: Image.network(_newsInApp[index].image),
                                ),
                                SizedBox(height: 12.0),
                                Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: Text(
                                    _newsInApp[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                ),
                                SizedBox(height: 12.0),
                                Container(
                                  margin: EdgeInsets.all(8.0),
                                  child: Text(
                                    _newsInApp[index].text,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('Published at:'),
                                      SizedBox(width: 6.0,),
                                      Text(_newsInApp[index].date,style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.0),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('For more Information:'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      InkWell(
                                          child: Text(
                                            _newsInApp[index].url,
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          onTap: () async {
                                            if (await canLaunch(
                                                _newsInApp[index].url)) {
                                              await launch(
                                                  _newsInApp[index].url);
                                            }
                                          }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                    },
                    icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                _newsInApp[index].author,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
