class WalletState {
  const WalletState({
    required this.isConnected,
    required this.isAdmin,
    this.address,
  });

  const WalletState.disconnected()
    : isConnected = false,
      isAdmin = false,
      address = null;

  final bool isConnected;
  final bool isAdmin;
  final String? address;

  WalletState copyWith({bool? isConnected, bool? isAdmin, String? address}) {
    return WalletState(
      isConnected: isConnected ?? this.isConnected,
      isAdmin: isAdmin ?? this.isAdmin,
      // address: address ?? this.address,
    );
  }
}
