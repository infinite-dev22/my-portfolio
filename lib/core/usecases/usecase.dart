import 'package:equatable/equatable.dart';

// Since we haven't added dartz yet, we will just use a simple Result class or add dartz.
// Actually, standard practice often uses Dartz for Either<Left, Right>.
// Let's add dartz to dependencies or just use a custom Result class to keep it simple and dependency-light if preferred.
// But the user asked for Clean Architecture, and Dartz is very common there.
// I will stick to a simple abstract class for now and if I need Either logic I'll implement a simple Result or add dartz.
// Let's add dartz in the next step to be robust.

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
