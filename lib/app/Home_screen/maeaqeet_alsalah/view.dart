import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  Map<String, String> prayerTimes = {};

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes();
  }

  Future<void> fetchPrayerTimes() async {
    final url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=Cairo&country=egypt&method=8');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        prayerTimes = Map<String, String>.from(data['data']['timings']);
      });
    } else {
      throw Exception('Failed to load prayer times');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مواقيت الصلاة',
        ),
      ),
      body: prayerTimes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.teal.shade50,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: prayerTimes.entries.map((entry) {
                  return Card(
                    elevation: 4,
                    color: Colors.teal.shade100,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      trailing: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
