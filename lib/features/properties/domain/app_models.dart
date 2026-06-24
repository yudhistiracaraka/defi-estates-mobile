enum PropertyStatus { available, soldOut, comingSoon }

enum TransactionType { purchase, dividend }

enum ContractStatus { active }

extension PropertyStatusX on PropertyStatus {
  String get label => switch (this) {
    PropertyStatus.available => 'Available',
    PropertyStatus.soldOut => 'Sold Out',
    PropertyStatus.comingSoon => 'Coming Soon',
  };
}

extension TransactionTypeX on TransactionType {
  String get label => switch (this) {
    TransactionType.purchase => 'Purchase',
    TransactionType.dividend => 'Dividend',
  };
}

extension ContractStatusX on ContractStatus {
  String get label => switch (this) {
    ContractStatus.active => 'Active',
  };
}

class PropertyDocument {
  const PropertyDocument({required this.name, required this.url});

  final String name;
  final String url;
}

class Property {
  const Property({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.tokenPrice,
    required this.totalTokens,
    required this.tokensSold,
    required this.status,
    required this.features,
    required this.documents,
    required this.returnRate,
    this.contractAddress,
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final int price;
  final double tokenPrice;
  final int totalTokens;
  final int tokensSold;
  final PropertyStatus status;
  final List<String> features;
  final List<PropertyDocument> documents;
  final double returnRate;
  final String? contractAddress;

  double get fundingProgress => tokensSold / totalTokens;
}

class PortfolioPosition {
  const PortfolioPosition({
    required this.propertyId,
    required this.propertyName,
    required this.tokensOwned,
    required this.investmentValue,
  });

  final String propertyId;
  final String propertyName;
  final int tokensOwned;
  final double investmentValue;
}

class UserPortfolio {
  const UserPortfolio({
    required this.totalInvested,
    required this.totalProperties,
    required this.properties,
  });

  final double totalInvested;
  final int totalProperties;
  final List<PortfolioPosition> properties;
}

class TransactionRecord {
  const TransactionRecord({
    required this.id,
    required this.type,
    required this.property,
    required this.tokens,
    required this.value,
    required this.date,
  });

  final int id;
  final TransactionType type;
  final String property;
  final int tokens;
  final double value;
  final String date;
}

class ContractDeployment {
  const ContractDeployment({
    required this.id,
    required this.name,
    required this.address,
    required this.date,
    required this.status,
  });

  final int id;
  final String name;
  final String address;
  final String date;
  final ContractStatus status;
}
