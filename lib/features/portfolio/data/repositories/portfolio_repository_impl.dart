import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/portfolio_entities.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, PortfolioData>> getPortfolioData() async {
    try {
      final localData = await localDataSource.getPortfolioData();
      return Right(localData);
    } catch (e) {
      return const Left(CacheFailure("Failed to load portfolio data"));
    }
  }
}
