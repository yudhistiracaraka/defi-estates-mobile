import '../../properties/domain/app_models.dart';

abstract class AppRepository {
  List<Property> getProperties();
  Property? getPropertyById(String id);
  UserPortfolio getUserPortfolio();
  List<TransactionRecord> getTransactions();
  List<ContractDeployment> getContractDeployments();
}
