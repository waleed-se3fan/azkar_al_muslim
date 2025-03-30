import 'package:azkar_al_muslim/data/stories.dart';
import 'package:flutter/material.dart';

class ProphetsStoriesScreen extends StatelessWidget {
  final List prophets = pomptStories;

  ProphetsStoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "قصص الأنبياء",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade800, Colors.teal.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: prophets.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  prophets[index]["النبي"],
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900),
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(Icons.arrow_back_ios, color: Colors.teal),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProphetDetailScreen(
                        prophet: prophets[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProphetDetailScreen extends StatelessWidget {
  final Map<String, dynamic> prophet;
  ProphetDetailScreen({required this.prophet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        prophet["النبي"]!,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildCard("القصة", prophet["القصة"], Colors.blue.shade50),
              _buildCard(
                  "مدة الدعوة", prophet["مدة_الدعوة"], Colors.green.shade50),
              _buildCard(
                  "مكان البعثة", prophet["مكان_البعثة"], Colors.orange.shade50),
              _buildListCard(
                  "المعجزات", prophet["المعجزات"], Colors.purple.shade50),
              _buildListCard(
                  "الابتلاءات", prophet["الابتلاءات"], Colors.red.shade50),
              _buildListCard(
                  "الأعداء", prophet["الأعداء"], Colors.brown.shade50),
              _buildListCard("كيف استجاب الله له",
                  prophet["كيف استجاب الله له"], Colors.cyan.shade50),
              _buildListCard("الدروس المستفادة", prophet["الدروس_المستفادة"],
                  Colors.teal.shade50),
              _buildListCard("الأحداث الرئيسية", prophet["أحداث_رئيسية"],
                  Colors.indigo.shade50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
              color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$title:",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(fontSize: 18), textAlign: TextAlign.right),
        ],
      ),
    );
  }

  Widget _buildListCard(String title, List<String> values, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
              color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$title:",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900),
            textAlign: TextAlign.right,
          ),
          ...values.map((item) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text("- $item",
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.right),
              )),
        ],
      ),
    );
  }
}
