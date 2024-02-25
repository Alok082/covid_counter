import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Api/header.dart';
import '../Api/model.dart';
import '../screens/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Calltheapi apicall = Calltheapi();

  Future<void> fetchData() async {
    print("1");
    final response = await http
        .get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    print("2");
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> regionalJson = data['data']['regional'];
      setState(() {
        regionalData =
            regionalJson.map((json) => Regional.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "States Of India",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 56, 23, 109)),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  fetchData();
                },
                child: const Text("fetch"),
              ),
              // IconButton(
              //   onPressed: () {
              //     FirebaseAuth.instance.signOut().then((value) {
              //       print("signout");
              //       Navigator.pushReplacementNamed(context, '/loginScreen');
              //     });
              //   },
              //   icon: Icon(
              //     Icons.logout_outlined,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          )
        ],
      ),
      body: regionalData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: regionalData.length,
              itemBuilder: (context, index) {
                final region = regionalData[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(region: region),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        12, MediaQuery.sizeOf(context).height * 0.001, 12, 12),
                    height: MediaQuery.sizeOf(context).height * 0.129,
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 139, 201, 252),
                          Color.fromARGB(238, 1, 141, 255),
                        ],
                      ),
                      // color: Color.fromARGB(255, 162, 235, 181), // Container color
                      boxShadow: const [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 255, 76, 76), // Shadow color
                          blurRadius: 9.0, // Spread of the shadow
                          offset: Offset(0, 0), // Offset in x and y direction
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                          10.0), // Optional: Set border radius
                    ),
                    // color: Colors.black,
                    child: Column(
                      children: [
                        Text(
                          region.loc,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text("Total Confirmed : ${region.totalConfirmed}"),
                        // Text("Total Deaths : ${region.deaths}"),
                        // Text("Total Recovered : ${region.discharged}"),
                      ],
                    ),
                  ),
                );

                // ListTile(
                //   title: Text(region.loc),
                //   subtitle: Text('Confirmed: '),
                // );
              },
            ),
    );
  }
}
