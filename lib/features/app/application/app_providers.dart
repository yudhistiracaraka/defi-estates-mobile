import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../properties/domain/app_models.dart';
import '../data/mock_app_repository.dart';
import '../domain/app_repository.dart';

final appRepositoryProvider = Provider<AppRepository>((ref) {
  return const MockAppRepository();
});

final propertiesProvider = Provider<List<Property>>((ref) {
  return ref.watch(appRepositoryProvider).getProperties();
});

final featuredPropertiesProvider = Provider<List<Property>>((ref) {
  return ref.watch(propertiesProvider).take(3).toList();
});

final portfolioProvider = Provider<UserPortfolio>((ref) {
  return ref.watch(appRepositoryProvider).getUserPortfolio();
});

final transactionsProvider = Provider<List<TransactionRecord>>((ref) {
  return ref.watch(appRepositoryProvider).getTransactions();
});

final contractDeploymentsProvider = Provider<List<ContractDeployment>>((ref) {
  return ref.watch(appRepositoryProvider).getContractDeployments();
});
