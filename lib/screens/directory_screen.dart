import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  String searchQuery = '';
  bool _isAdmin = false; // 1. Admin state tracking

  // 2. Password verification logic
  void _showAdminLoginDialog() {
    if (_isAdmin) {
      // Agar pehle se admin hai, toh logout/lock kar do
      setState(() {
        _isAdmin = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Admin Mode Disabled')),
      );
      return;
    }

    final passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Admin Login'),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Enter Admin Password'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Hardcoded password for demo/project evaluation (e.g., "admin123")
                if (passwordController.text == 'admin123') {
                  setState(() {
                    _isAdmin = true;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Admin Mode Enabled Successfully!')),
                  );
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect Password!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        );
      },
    );
  }

  // 3. Add Alumni Dialog Form
  void _showAddAlumniDialog(BuildContext context) {
    final nameController = TextEditingController();
    final companyController = TextEditingController();
    final roleController = TextEditingController();
    final batchController = TextEditingController();
    final linkedinController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Alumni (Admin)'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
                TextField(controller: companyController, decoration: const InputDecoration(labelText: 'Company')),
                TextField(controller: roleController, decoration: const InputDecoration(labelText: 'Role')),
                TextField(controller: batchController, decoration: const InputDecoration(labelText: 'Batch (e.g. 2023)')),
                TextField(controller: linkedinController, decoration: const InputDecoration(labelText: 'LinkedIn URL')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('Alumni').add({
                    'name': nameController.text,
                    'company': companyController.text,
                    'role': roleController.text,
                    'batch': batchController.text,
                    'linkedin': linkedinController.text,
                  });
                  if (context.mounted) Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Directory'),
        actions: [
          // Admin Toggle Icon Button in App Bar
          IconButton(
            icon: Icon(
              _isAdmin ? Icons.lock_open : Icons.lock_outline,
              color: _isAdmin ? Colors.green : Colors.grey,
            ),
            tooltip: _isAdmin ? 'Logout Admin' : 'Admin Login',
            onPressed: _showAdminLoginDialog,
          ),
        ],
      ),
      // 4. Conditional Rendering: FAB only appears if _isAdmin is true
      floatingActionButton: _isAdmin
          ? FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () => _showAddAlumniDialog(context),
      )
          : null,
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by Name or Company',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),

          // Firestore Realtime Data List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Alumni').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data?.docs ?? [];

                final filteredDocs = docs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final name = (data['name'] ?? '').toString().toLowerCase();
                  final company = (data['company'] ?? '').toString().toLowerCase();
                  return name.contains(searchQuery) || company.contains(searchQuery);
                }).toList();

                if (filteredDocs.isEmpty) {
                  return const Center(child: Text('No Alumni Found'));
                }

                return ListView.builder(
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    final data = filteredDocs[index].data() as Map<String, dynamic>;

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(data['name'] != null && data['name'].isNotEmpty
                              ? data['name'][0].toUpperCase()
                              : 'A'),
                        ),
                        title: Text(data['name'] ?? 'Unknown'),
                        subtitle: Text('${data['role'] ?? ''} @ ${data['company'] ?? ''}\nBatch: ${data['batch'] ?? ''}'),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: const Icon(Icons.open_in_new, color: Colors.blue),
                          onPressed: () async {
                            final urlString = data['linkedin'] ?? '';
                            if (urlString.isNotEmpty) {
                              final Uri url = Uri.parse(urlString);
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}