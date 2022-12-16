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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Batches',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  color: Colors.grey[200],
                  child: Expanded(
                    child: FutureBuilder(
                      future: BatchDataSource().getAllBatch(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.count(
                            childAspectRatio: 3 / 2,
                            crossAxisCount: 2,
                            children: [
                              //Get data from snapshot
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
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Students',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
