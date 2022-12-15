import 'package:flutter/material.dart';

import '../../data_source/local_data_source/batch_data_source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text(
            'Batches',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FutureBuilder(
              future: BatchDataSource().getAllBatch(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(crossAxisCount: 2, children: [
                    for (var batch in snapshot.data!)
                      InkWell(
                        splashColor: Colors.red,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/batchStudentScreen',
                            arguments: batch.batchName,
                          );
                        },
                        child: Card(
                          color: Colors.amber,
                          child: Center(
                            child: Text(
                              batch.batchName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
