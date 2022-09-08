import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  bool darkmode = true;
  bool keymode = false;
  String darktext = 'On';
  String keytext = 'Off';

  _launchURLBrowser() async {
    String url = 'https://www.youtube.com/c/AkashCraft2';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.grey[900],
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ListTile(
                title: Text('Accent Colour', style: TextStyle(fontSize: 20, color: Colors.white)),
                subtitle: Text('Purple', style: TextStyle(fontSize: 15, color: Colors.purpleAccent[100]),),
                leading: Icon(Icons.brush, size: 30, color: Colors.white,),
              )
            ),
            Card(
                color: Colors.grey[900],
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SwitchListTile(
                  activeColor: Colors.purpleAccent[100],
                  inactiveThumbColor: Colors.grey,
                  value: darkmode,
                  onChanged: (bool selected){
                    if (selected){
                      darkmode = selected;
                      darktext = 'On';
                    } else {
                      darkmode = false;
                      darktext = 'Off';
                    }
                    setState((){});
                  },
                  title: Text('Dark Mode', style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(darktext, style: TextStyle(fontSize: 15, color: Colors.purpleAccent[100]),),
                  secondary: Icon(Icons.palette, size: 30, color: Colors.white,),
                )
            ),
            Card(
                color: Colors.grey[900],
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ListTile(
                  title: Text('Decimal Places', style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text('0', style: TextStyle(fontSize: 15, color: Colors.purpleAccent[100]),),
                  leading: Icon(Icons.adjust, size: 30, color: Colors.white,),
                )
            ),
            Card(
                color: Colors.grey[900],
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SwitchListTile(
                  activeColor: Colors.purpleAccent[100],
                  inactiveThumbColor: Colors.grey,
                  value: keymode,
                  onChanged: (bool selected){
                    if (selected){
                      keymode = selected;
                      keytext = 'On';
                    } else {
                      keymode = false;
                      keytext = 'Off';
                    }
                    setState((){});
                  },
                  title: Text('Inverted Keypad', style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text(keytext, style: TextStyle(fontSize: 15, color: Colors.purpleAccent[100]),),
                  secondary: Icon(Icons.keyboard, size: 30, color: Colors.white,),
                )
            ),
            Card(
                color: Colors.grey[900],
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ListTile(
                  title: Text('About', style: TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text('Open', style: TextStyle(fontSize: 15, color: Colors.purpleAccent[100]),),
                  leading: Icon(Icons.text_snippet, size: 30, color: Colors.white,),
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                          child: AlertDialog(
                              actions: [TextButton(onPressed: () {_launchURLBrowser();}, child: Text('YOUTUBE',style: TextStyle(fontSize: 15 ,color: Colors.purpleAccent[100])))
                                ,TextButton(onPressed: () {Navigator.pop(this.context);}, child: Text('OK',style: TextStyle(fontSize: 15 ,color: Colors.purpleAccent[100]))),
                              ],
                              backgroundColor: Colors.grey[900],
                              title: Text('Word from Developer',style: TextStyle(fontSize: 25,color: Colors.white)),
                              content: Text(
                                'It’s been my absolute pleasure to present you this app. If you enjoy my works, support me by buying me a cup of coffee. Thank you for using this app.', style: TextStyle(fontSize: 20,color: Colors.white),
                              )
                          ),
                        );
                      });}
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Version 1.0.0', style: TextStyle(fontSize: 15,color: Colors.grey[400])),
                  Text('App Developed By', style: TextStyle(fontSize: 15,color: Colors.grey[400])),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage('assets/1.jpeg')),
                      SizedBox(width: 8,),
                      Text('AkashCraft',style: TextStyle(fontSize: 20, color: Colors.grey[600]),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
