import 'package:bloc_pattern_implemented/BLOCs/UserBloc.dart';
import 'package:bloc_pattern_implemented/MODELs/User.dart';
import 'package:bloc_pattern_implemented/UTILs/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
   UserPageState createState() =>  UserPageState();
}

class  UserPageState extends State<UserPage> {
  String _newName;

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Bloc'),
      ),
      body: StreamBuilder<User>(
        stream: userBloc.outUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${snapshot.data.name}',
                  ),
                  TextField(
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(labelText: snapshot.data.name),
                  ),
                ],
              ),
            );
          }else{
            return CircularProgressIndicator();


          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userBloc.updateName(_newName);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}