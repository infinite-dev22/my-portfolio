import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/portfolio_entities.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolioData implements UseCase<Either<Failure, PortfolioData>, NoParams> {
  final PortfolioRepository repository;

  GetPortfolioData(this.repository);

  @override
  Future<Either<Failure, PortfolioData>> call(NoParams params) async {
    return await repository.getPortfolioData();
  }
}
