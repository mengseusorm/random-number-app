import 'package:flutter/material.dart'; 

class Settingpage extends StatelessWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.shade100,
            ),
            child: const Icon(Icons.person_rounded, size: 40),
          ),
          const SizedBox(height: 20),
          const Text('Profile Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
