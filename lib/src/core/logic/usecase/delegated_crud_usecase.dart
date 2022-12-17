import 'package:clean_core/clean_core.dart';

///Default implementation of [CRUDUseCase] of type Domain extends
///[BasicDomainObject]
///It's basically a delegate to the repo.
///
/// EXAMPLE:
/// This is the implementation of ParentUseCase.
/// See [BasicDomainObject] for ParentDomain's example code.
/// See [CRUDUseCase] for ParentUseCase's example code.
/// ```dart
///   class ParentUseCaseImpl extends DefaultCRUDUseCase<ParentDomain>
///     implements ParentUseCase {
///      late ParentRepo _repo;
///
///     ParentUseCaseImpl(ParentRepo repo)
///         : _repo = repo,
///           super(repo: repo);
///
///     void doStuffInUseCase(){
///        print('Doing Stuff in the use case layer...');
///     }
///   }
/// ```
abstract class DelegatedRUDUseCase<Domain extends BasicDomainObject,
    CRUDRepo extends CRUDRepository<Domain>> extends CRUDUseCase<Domain> {
  CRUDRepo repo;

  DelegatedRUDUseCase({required this.repo});

  @override
  Domain create(Domain newObject) => repo.create(newObject);

  @override
  Domain edit(Domain objectToEdit) => repo.edit(objectToEdit);

  @override
  List<Domain> findAll() => repo.findAll();

  @override
  Domain? findById(int keyId) => repo.findById(keyId);

  @override
  void delete(Domain objectToDestroy) => repo.delete(objectToDestroy);

  @override
  void deleteById(int id) => repo.deleteById(id);

  @override
  int count() => repo.count();

  @override
  void init() {}

  @override
  void dispose() {}
}
