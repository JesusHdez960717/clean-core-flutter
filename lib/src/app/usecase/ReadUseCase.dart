import 'package:clean_core/clean_core.dart';

///[AbstractUseCase] of Read operations, of type Domain extends [BasicDomainObject].
///Generally not implemented, instead extends the repo from [DefaultReadUseCase].
///
/// See [AbstractUseCase] for general info.
///
/// EXAMPLE:
/// This is the definition of Parent ReadUseCase, it need to be
/// implemented after, implementation example at [DefaultReadUseCase].
/// ```dart
///   abstract class ParentUseCase extends ReadUseCase<ParentDomain> {
///     void doStuffInUseCase();
///   }
/// ```
abstract class ReadUseCase<Domain extends BasicDomainObject>
    implements AbstractUseCase {
  ///Find all domains.
  List<Domain> findAll();

  ///Find the correspondent domain by it's Key Id.
  Domain findBy(int keyId);

  ///Count the amount of domains.
  ///By default calling the length of findAll().
  int count() {
    return findAll().length;
  }
}
