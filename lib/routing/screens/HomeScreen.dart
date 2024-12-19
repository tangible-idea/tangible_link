import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tangible_link/routing/app_router.dart';

// Data Model for a Search Result
class SearchResult {
  final String title;
  final String subtitle;
  final String rating;
  final String image;

  SearchResult({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.image,
  });
}

// Sample Data
final searchResultsProvider = StateProvider<List<SearchResult>>((ref) {
  return [
    SearchResult(
        title: '유튜브 제목',
        subtitle: '유튜브 채널 이름',
        rating: '4.9',
        image: 'https://via.placeholder.com/400x200'),
    SearchResult(
        title: 'Arches National Park',
        subtitle: 'Utah, US',
        rating: '4.7',
        image: 'https://via.placeholder.com/400x200'),
    SearchResult(
        title: 'Göreme National Park',
        subtitle: 'Nevşehir merkez, Turkey',
        rating: '4.9',
        image: 'https://via.placeholder.com/400x200'),
    SearchResult(
        title: 'Serengeti National Park',
        subtitle: 'Top Recommended',
        rating: '4.8',
        image: 'https://via.placeholder.com/400x200'),
  ];
});

// Search Filter State Provider
final searchQueryProvider = StateProvider<String>((ref) => "");

// Home Screen
class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchResultsProvider);

    // Filtered Results
    final filteredResults = searchResults
        .where((result) =>
        result.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFDEAD6),
      body: SafeArea(
        child: Column(
          children: [
            // User Profile
            _buildProfileHeader(ref),

            // Search Box
            _buildSearchBox(ref),

            // Filtered Results
            Expanded(
              child: ListView.builder(
                itemCount: filteredResults.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return _buildSearchCard(filteredResults[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profile Header
  Widget _buildProfileHeader(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage:
                NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(width: 12),
              Text(
                "Welcome\nEvelyn",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              ref.read(goRouterProvider).go('/youtube-link');
            },
              child: const Icon(Icons.search, size: 28, color: Colors.black87)),
        ],
      ),
    );
  }

  // Search Box
  Widget _buildSearchBox(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        controller: _searchController,
        onChanged: (query) => ref.read(searchQueryProvider.notifier).state =
            query, // Update search state
        decoration: InputDecoration(
          hintText: "National Park",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.tune, color: Colors.orangeAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Search Result Card
  Widget _buildSearchCard(SearchResult result) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Thumbnail Image
          Image.network(
            result.image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Gradient Overlay
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Card Details
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      result.rating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  result.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  result.subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}