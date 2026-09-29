import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('DION', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 24),

          const _NewConversationCard(),

          const SizedBox(height: 28),

          Text('Your Selves', style: Theme.of(context).textTheme.titleLarge),

          const SizedBox(height: 12),

          const _PersonaGrid(),
        ],
      ),
    );
  }
}

class _NewConversationCard extends StatelessWidget {
  const _NewConversationCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "What's up?", //next try to randomize this text with a list of prompts
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                ),

                const Spacer(),

                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward),
                  label: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonaGrid extends StatelessWidget {
  const _PersonaGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _PersonaCard(
          name: 'Soaz',
          subtitle: 'Pessimistic',
          icon: Icons.psychology_alt_outlined,
        ),
      ],
    ); // GridView
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard({
    required this.name,
    required this.subtitle,
    required this.icon,
  });

  final String name;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(child: Icon(icon)),

              const Spacer(),

              Text(name, style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 4),

              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
