import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/portfolio_entities.dart';
import '../../domain/usecases/get_portfolio_data.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioData getPortfolioData;

  PortfolioBloc({required this.getPortfolioData}) : super(const PortfolioState()) {
    on<GetPortfolioDataEvent>(_onGetPortfolioData);
  }

  Future<void> _onGetPortfolioData(
    GetPortfolioDataEvent event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(status: PortfolioStatus.loading));
    final result = await getPortfolioData(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        status: PortfolioStatus.error,
        errorMessage: failure.message,
      )),
      (data) => emit(state.copyWith(
        status: PortfolioStatus.loaded,
        portfolioData: data,
      )),
    );
  }
}
