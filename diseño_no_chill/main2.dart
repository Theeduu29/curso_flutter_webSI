import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.anaheimTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Side Hustle', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'share', child: Text('Share')),
              const PopupMenuItem(value: 'settings', child: Text('Settings')),
            ],
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Projects', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProjectCard(index: index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Quick Actions', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            const QuickActions(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text('Menu', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
            ),
            ListTile(title: const Text('Projects'), leading: const Icon(Icons.book), onTap: () {}),
            ListTile(title: const Text('Draft'), leading: const Icon(Icons.draw), onTap: () {}),
            ListTile(title: const Text('Shared with me'), leading: const Icon(Icons.switch_access_shortcut_outlined), onTap: () {}),
            const Divider(),
            ListTile(title: const Text('Settings'), leading: const Icon(Icons.settings), onTap: () {}),
            ListTile(title: const Text('Invite members'), leading: const Icon(Icons.people), onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final int index;

  const ProjectCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(radius: 7, backgroundColor: Colors.red),
                Text('Project $index', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec odio nec nisl sodales fermentum.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey.shade300),
                foregroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text('Edit', style: TextStyle(color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _QuickActionIcon(icon: Icons.add, label: 'New Draft'),
        _QuickActionIcon(icon: Icons.book, label: 'New Project'),
      ],
    );
  }
}

class _QuickActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(15),
          child: Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 5),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
