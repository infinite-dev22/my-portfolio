import 'package:dartz/dartz.dart';
import 'package:portfolio_app/core/error/failures.dart';
import 'package:portfolio_app/features/portfolio/domain/entities/portfolio_entities.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, PortfolioData>> getPortfolioData();
}
