import 'package:e_office/maps.dart';
import 'package:e_office/user.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final User user;

  DetailPage(this.user);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('PROFILE'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              color: Colors.blue[400],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                            image: DecorationImage(
                                image: NetworkImage(widget.user.picture),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.user.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Basic Info',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "Gender "),
                                    TextSpan(
                                        text: widget.user.gender,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "Age "),
                                    TextSpan(
                                        text: widget.user.age.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "Phone "),
                                    TextSpan(
                                        text: widget.user.phone,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "E-mail "),
                                    TextSpan(
                                        text: widget.user.email,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "Lives in "),
                                    TextSpan(
                                        text: widget.user.address,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(text: "Favorite fruit "),
                                    TextSpan(
                                        text: widget.user.favoriteFruit,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ]),
                            ),
                            Divider(),
                            Text(
                              'Friends',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                  height: 1.5),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.user.friends.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.alternate_email,
                                      size: 13.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(widget.user.friends[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0)),
                                  ],
                                );
                              },
                            ),
                            Divider(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapPage(
                                            latitude: widget.user.latitude,
                                            longitude: widget.user.longitude)));
                              },
                              child: Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Location :'),
                                          Text('Lat : ${widget.user.latitude}'),
                                          Text(
                                              'Long : ${widget.user.longitude}')
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios)
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
