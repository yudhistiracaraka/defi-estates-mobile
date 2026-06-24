import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/application/app_providers.dart';
import '../../properties/domain/app_models.dart';

class BrowseFilters {
  static const allLocations = 'All Locations';

  const BrowseFilters({
    this.status,
    this.location = allLocations,
    this.minPrice,
    this.maxPrice,
    this.query = '',
  });

  final PropertyStatus? status;
  final String location;
  final int? minPrice;
  final int? maxPrice;
  final String query;

  BrowseFilters copyWith({
    PropertyStatus? status,
    bool clearStatus = false,
    String? location,
    int? minPrice,
    int? maxPrice,
    String? query,
  }) {
    return BrowseFilters(
      status: clearStatus ? null : status ?? this.status,
      location: location ?? this.location,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      query: query ?? this.query,
    );
  }
}

class BrowseController extends Notifier<BrowseFilters> {
  @override
  BrowseFilters build() => const BrowseFilters();

  void updateQuery(String value) {
    state = state.copyWith(query: value);
  }

  void updateLocation(String value) {
    state = state.copyWith(location: value);
  }

  void updateStatus(PropertyStatus? value) {
    state = state.copyWith(status: value, clearStatus: value == null);
  }

  void updateMinPrice(int? value) {
    state = state.copyWith(minPrice: value);
  }

  void updateMaxPrice(int? value) {
    state = state.copyWith(maxPrice: value);
  }

  void reset() {
    state = const BrowseFilters();
  }
}

final browseControllerProvider =
    NotifierProvider<BrowseController, BrowseFilters>(BrowseController.new);

final browseLocationsProvider = Provider<List<String>>((ref) {
  final locations =
      ref
          .watch(propertiesProvider)
          .map((property) => property.location.split(',').first.trim())
          .toSet()
          .toList()
        ..sort();
  return [BrowseFilters.allLocations, ...locations];
});

final filteredPropertiesProvider = Provider<List<Property>>((ref) {
  final properties = ref.watch(propertiesProvider);
  final filters = ref.watch(browseControllerProvider);

  return properties.where((property) {
    final query = filters.query.toLowerCase();
    final matchesQuery =
        query.isEmpty ||
        property.title.toLowerCase().contains(query) ||
        property.location.toLowerCase().contains(query);
    final matchesStatus =
        filters.status == null || property.status == filters.status;
    final matchesLocation =
        filters.location == BrowseFilters.allLocations ||
        property.location.contains(filters.location);
    final matchesMin =
        filters.minPrice == null || property.price >= filters.minPrice!;
    final matchesMax =
        filters.maxPrice == null || property.price <= filters.maxPrice!;

    return matchesQuery &&
        matchesStatus &&
        matchesLocation &&
        matchesMin &&
        matchesMax;
  }).toList();
});
