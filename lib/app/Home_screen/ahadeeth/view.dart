import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HadithScreenState createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<dynamic> ahadeeth = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchAhadeeth();
  }

  Future<void> fetchAhadeeth() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final response = await http.get(Uri.parse(
          'https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=300'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          ahadeeth = data['items'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load ahadeeth');
      }
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأحاديث'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text('حدث خطأ: $error'))
              : ListView.builder(
                  itemCount: ahadeeth.length,
                  itemBuilder: (context, index) {
                    final hadith = ahadeeth[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'حديث رقم ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              hadith['arab'],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
