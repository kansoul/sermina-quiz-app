import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../webview/webview_screen.dart';

class Link {
  String name;
  String icon;
  String url;

  Link({required this.name, required this.icon, required this.url});
}

Future<List<Link>> fetchLinks() async {
  final response =
      await http.get(Uri.parse("http://192.168.43.68:8081/api/links"));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<Link> links = jsonData
        .map((json) => Link(
              name: json['name'],
              icon: json['icon'],
              url: json['url'],
            ))
        .toList();
    return links;
  } else {
    throw Exception('Failed to load links');
  }
}

class SecretAppScreen extends StatelessWidget {
  const SecretAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/icons/serect_bg.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: fetchLinks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Link> links = snapshot.data as List<Link>;

              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/luu-like.png'),
                    radius: 80.0,
                  ),
                  Text(
                    "Luu Never Die",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                  ),
                  Expanded(
                      child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: links.length,
                    itemBuilder: (context, index) {
                      Link link = links[index];
                      print("http://192.168.43.68:8081/${link.url}");
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebviewScreen(
                                      urlLinks: link.url,
                                    ))),
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "http://192.168.43.68:8081/${link.icon}"),
                                radius: 20.0,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(link.name),
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
