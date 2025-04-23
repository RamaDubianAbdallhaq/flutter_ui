import 'package:flutter/material.dart';

class CloudCard extends StatelessWidget {
  const CloudCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud, size: 30, color: Colors.blue),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Cloud Storages',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Text(
              '5126 Files',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.sync, size: 20, color: Colors.green),
                SizedBox(width: 5),
                Text('Sync active', style: TextStyle(color: Colors.green)),
              ],
            ),
            SizedBox(height: 15),
            LinearProgressIndicator(
              value: 485 / 2000,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('485 GB of 2 TB used', style: TextStyle(fontSize: 14)),
                Text('24%', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unlimited storage',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp. 150.000 / mo',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Upgrade'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
