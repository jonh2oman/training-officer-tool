import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../theme/app_theme.dart';
import '../domain/help_topic.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String _searchQuery = '';
  
  List<HelpTopic> get _filteredTopics {
    if (_searchQuery.isEmpty) return helpTopics;
    return helpTopics.where((t) => 
      t.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      t.content.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      t.category.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HELP & DOCUMENTATION'),
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GlassContainer(
              opacity: 0.05,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: BorderRadius.circular(16),
              child: TextField(
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'Search documentation...',
                  border: InputBorder.none,
                  icon: Icon(LucideIcons.search, size: 18, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              itemCount: _filteredTopics.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final topic = _filteredTopics[index];
                return _HelpTopicCard(topic: topic);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpTopicCard extends StatelessWidget {
  final HelpTopic topic;
  const _HelpTopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.03,
      child: ExpansionTile(
        title: Text(
          topic.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          topic.category.toUpperCase(),
          style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.primary, letterSpacing: 1),
        ),
        leading: Icon(LucideIcons.helpCircle, color: Theme.of(context).colorScheme.primary, size: 20),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedAlignment: Alignment.topLeft,
        children: [
          Text(
            topic.content,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
