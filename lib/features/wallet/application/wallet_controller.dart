import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/wallet_state.dart';

class WalletController extends Notifier<WalletState> {
  @override
  WalletState build() => const WalletState.disconnected();

  void connectInvestor() {
    state = const WalletState(
      isConnected: true,
      isAdmin: false,
      address: '0x1234567890ABCDEF1234567890ABCDEF5678',
    );
  }

  void connectAdmin() {
    state = const WalletState(
      isConnected: true,
      isAdmin: true,
      address: '0xABCDEF1234567890ABCDEF12345678905678',
    );
  }

  void disconnect() {
    state = const WalletState.disconnected();
  }
}

final walletControllerProvider =
    NotifierProvider<WalletController, WalletState>(WalletController.new);
