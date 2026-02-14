part of 'portfolio_bloc.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  final PortfolioStatus status;
  final PortfolioData? portfolioData;
  final String? errorMessage;

  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.portfolioData,
    this.errorMessage,
  });

  PortfolioState copyWith({
    PortfolioStatus? status,
    PortfolioData? portfolioData,
    String? errorMessage,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      portfolioData: portfolioData ?? this.portfolioData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, portfolioData, errorMessage];
}
