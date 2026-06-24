import '../../properties/domain/app_models.dart';
import '../domain/app_repository.dart';

class MockAppRepository implements AppRepository {
  const MockAppRepository();

  @override
  List<ContractDeployment> getContractDeployments() => const [
    ContractDeployment(
      id: 1,
      name: 'Luxury Downtown Apartment',
      address: '0x1234...5678',
      date: '2023-06-10',
      status: ContractStatus.active,
    ),
    ContractDeployment(
      id: 2,
      name: 'Beachfront Villa',
      address: '0xabcd...efgh',
      date: '2023-05-15',
      status: ContractStatus.active,
    ),
    ContractDeployment(
      id: 3,
      name: 'Modern Office Building',
      address: '0x7890...1234',
      date: '2023-04-22',
      status: ContractStatus.active,
    ),
    ContractDeployment(
      id: 4,
      name: 'Urban Retail Space',
      address: '0xefgh...ijkl',
      date: '2023-03-05',
      status: ContractStatus.active,
    ),
    ContractDeployment(
      id: 5,
      name: 'Historic Brownstone',
      address: '0x2468...1357',
      date: '2023-02-18',
      status: ContractStatus.active,
    ),
  ];

  @override
  Property? getPropertyById(String id) {
    try {
      return getProperties().firstWhere((property) => property.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Property> getProperties() => const [
    Property(
      id: '1',
      title: 'Luxury Downtown Apartment',
      description:
          'A stunning luxury apartment in the heart of the city with premium finishes, rooftop amenities, and strong rental demand.',
      imageUrl:
          'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?auto=format&fit=crop&w=1470&q=80',
      location: 'New York, NY',
      price: 450000,
      tokenPrice: 0.5,
      totalTokens: 1000,
      tokensSold: 650,
      status: PropertyStatus.available,
      features: [
        '3 Bedrooms',
        '2 Bathrooms',
        '1,800 sq ft',
        'Built in 2020',
        'Doorman',
        'Gym',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Financial Projections', url: '#'),
        PropertyDocument(name: 'Inspection Report', url: '#'),
      ],
      contractAddress: '0x1234...5678',
      returnRate: 8.2,
    ),
    Property(
      id: '2',
      title: 'Beachfront Villa',
      description:
          'Luxurious beachfront property with private pool, panoramic ocean views, and premium vacation-rental positioning.',
      imageUrl:
          'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?auto=format&fit=crop&w=1470&q=80',
      location: 'Miami, FL',
      price: 1200000,
      tokenPrice: 1.2,
      totalTokens: 1000,
      tokensSold: 1000,
      status: PropertyStatus.soldOut,
      features: [
        '5 Bedrooms',
        '6 Bathrooms',
        '4,500 sq ft',
        'Private Pool',
        'Beach Access',
        'Smart Home',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Financial Projections', url: '#'),
        PropertyDocument(name: 'Inspection Report', url: '#'),
      ],
      contractAddress: '0xabcd...efgh',
      returnRate: 10.5,
    ),
    Property(
      id: '3',
      title: 'Modern Office Building',
      description:
          'Prime commercial real estate in the CBD with long-term tenants and stable cash flow potential.',
      imageUrl:
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1470&q=80',
      location: 'Chicago, IL',
      price: 3500000,
      tokenPrice: 3.5,
      totalTokens: 1000,
      tokensSold: 300,
      status: PropertyStatus.available,
      features: [
        '25,000 sq ft',
        '10 Floors',
        'Parking Garage',
        'LEED Certified',
        'Conference Center',
        '24/7 Security',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Tenant Agreements', url: '#'),
        PropertyDocument(name: 'Financial Projections', url: '#'),
      ],
      contractAddress: '0x7890...1234',
      returnRate: 7.8,
    ),
    Property(
      id: '4',
      title: 'Mountain Retreat',
      description:
          'Luxury cabin with breathtaking views, rustic-modern interiors, and premium seasonal demand.',
      imageUrl:
          'https://images.unsplash.com/photo-1518780664697-55e3ad937233?auto=format&fit=crop&w=1530&q=80',
      location: 'Aspen, CO',
      price: 875000,
      tokenPrice: 0.875,
      totalTokens: 1000,
      tokensSold: 0,
      status: PropertyStatus.comingSoon,
      features: [
        '4 Bedrooms',
        '3 Bathrooms',
        '2,800 sq ft',
        'Hot Tub',
        'Fireplace',
        '2-Car Garage',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Financial Projections', url: '#'),
        PropertyDocument(name: 'Inspection Report', url: '#'),
      ],
      returnRate: 9.1,
    ),
    Property(
      id: '5',
      title: 'Urban Retail Space',
      description:
          'High-traffic retail location in a vibrant urban neighborhood with strong lease demand.',
      imageUrl:
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&w=1374&q=80',
      location: 'Austin, TX',
      price: 680000,
      tokenPrice: 0.68,
      totalTokens: 1000,
      tokensSold: 520,
      status: PropertyStatus.available,
      features: [
        '2,000 sq ft',
        'Corner Location',
        'High Foot Traffic',
        'Recently Renovated',
        'Storage Space',
        'Outdoor Seating',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Market Analysis', url: '#'),
        PropertyDocument(name: 'Financial Projections', url: '#'),
      ],
      contractAddress: '0xefgh...ijkl',
      returnRate: 8.7,
    ),
    Property(
      id: '6',
      title: 'Historic Brownstone',
      description:
          'Beautifully restored brownstone that blends classic architecture with modern upgrades.',
      imageUrl:
          'https://images.unsplash.com/photo-1448630360428-65456885c650?auto=format&fit=crop&w=1467&q=80',
      location: 'Boston, MA',
      price: 1850000,
      tokenPrice: 1.85,
      totalTokens: 1000,
      tokensSold: 780,
      status: PropertyStatus.available,
      features: [
        '4 Bedrooms',
        '3.5 Bathrooms',
        '3,200 sq ft',
        'Original Hardwood Floors',
        'Garden',
        'Finished Basement',
      ],
      documents: [
        PropertyDocument(name: 'Property Deed', url: '#'),
        PropertyDocument(name: 'Historic Designation', url: '#'),
        PropertyDocument(name: 'Renovation Permits', url: '#'),
      ],
      contractAddress: '0x2468...1357',
      returnRate: 6.9,
    ),
  ];

  @override
  List<TransactionRecord> getTransactions() => const [
    TransactionRecord(
      id: 1,
      type: TransactionType.purchase,
      property: 'Luxury Downtown Apartment',
      tokens: 2,
      value: 1.0,
      date: '2023-06-15',
    ),
    TransactionRecord(
      id: 2,
      type: TransactionType.purchase,
      property: 'Beachfront Villa',
      tokens: 1,
      value: 1.2,
      date: '2023-05-22',
    ),
    TransactionRecord(
      id: 3,
      type: TransactionType.dividend,
      property: 'Luxury Downtown Apartment',
      tokens: 0,
      value: 0.05,
      date: '2023-04-01',
    ),
    TransactionRecord(
      id: 4,
      type: TransactionType.purchase,
      property: 'Urban Retail Space',
      tokens: 1,
      value: 0.67,
      date: '2023-03-10',
    ),
  ];

  @override
  UserPortfolio getUserPortfolio() => const UserPortfolio(
    totalInvested: 2.87,
    totalProperties: 3,
    properties: [
      PortfolioPosition(
        propertyId: '1',
        propertyName: 'Luxury Downtown Apartment',
        tokensOwned: 2,
        investmentValue: 1.0,
      ),
      PortfolioPosition(
        propertyId: '2',
        propertyName: 'Beachfront Villa',
        tokensOwned: 1,
        investmentValue: 1.2,
      ),
      PortfolioPosition(
        propertyId: '5',
        propertyName: 'Urban Retail Space',
        tokensOwned: 1,
        investmentValue: 0.67,
      ),
    ],
  );
}
