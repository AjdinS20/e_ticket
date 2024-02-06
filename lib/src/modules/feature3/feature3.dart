import 'package:e_ticket_ris/database_helper.dart';
import 'package:e_ticket_ris/src/modules/auth/user.dart';
import 'package:flutter/material.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';

class ProfilePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: DatabaseHelper.instance.getUserDetails(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          User user = snapshot.data!;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  SizedBox(height: 20),
                  _buildProfileField('Name', user.ime),
                  _buildProfileField('Surname', user.prezime),
                  _buildProfileField('Email', user.email),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text('No user data found'));
        }
      },
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: hexToColor("#182138"),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: hexToColor("#00426C"),
            ),
          ),
        ],
      ),
    );
  }
}
