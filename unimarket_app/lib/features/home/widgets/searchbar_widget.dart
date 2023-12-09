import 'package:flutter/material.dart';
import 'package:unimarket_app/core/common/horizontal_space.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.filter_tilt_shift,
                // size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
