import 'package:flutter/material.dart';
import 'package:guard_patrolling/universaldata.dart';
import '../Controllers/Login_controller.dart';
import '../Models/Login_models.dart';
class Profilemenu extends StatefulWidget {
  Userdata? fromdata;
  Profilemenu({Key? key, this.fromdata}) : super(key: key);

  @override
  State<Profilemenu> createState() => _ProfilemenuState();
}

class _ProfilemenuState extends State<Profilemenu> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: ListView(
        children: [
        Container(
        height: 160,
        decoration: BoxDecoration(
        color: Colors.blue.shade100
        ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                    NetworkImage('https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                  ),
                ),
              ],),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            children: [
              Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                  //side: BorderSide(color: Colors.lightBlue)),
                elevation: 3.0,
                child: ListTile(
                  title: Text(
                  "Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                     globaldata.Name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5.0),
                //     side: BorderSide(color: Colors.lightBlue)),
                elevation: 3.0,
                child: ListTile(
                  title: Text(
                    'E-mail',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      globaldata.EMail,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5.0),
                //     side: BorderSide(color: Colors.lightBlue)),
                elevation: 3.0,
                child: ListTile(
                  title: Text(
                    'Mobile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                     globaldata.PhoneNo,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        ],
      ),
    );
  }
}
class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

