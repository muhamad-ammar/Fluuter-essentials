import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print("Got Response successfully ");
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking example"),
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID ${data[index]['id']}"),
                  leading: Image.network(data[index]["url"]),
                );
              }),
              itemCount: data.length,
            )
          : Text('hi'),
    );
  }
}
