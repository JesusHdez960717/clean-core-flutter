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
abstract class DefaultCRUDUseCase<Domain extends BasicDomainObject>
    extends CRUDUseCase<Domain> {
  CRUDRepository<Domain> repo;

  DefaultCRUDUseCase({required this.repo});

  @override
  Domain create(Domain newObject) {
    print("${PropertyChangeConstrains.BEFORE_CREATE}  => $newObject");
    newObject = repo.create(newObject);
    print("${PropertyChangeConstrains.AFTER_CREATE}  => $newObject");
    return newObject;
  }

  @override
  Domain edit(Domain objectToEdit) {
    print("${PropertyChangeConstrains.BEFORE_EDIT}  => $objectToEdit");
    Domain domain = repo.edit(objectToEdit);
    print("${PropertyChangeConstrains.AFTER_EDIT}  => $objectToEdit");
    return domain;
  }

  @override
  List<Domain> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => EmptyList{}");
    List<Domain> list = repo.findAll();
    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  Domain findBy(int keyId) {
    print("${PropertyChangeConstrains.BEFORE_FIND_BY}  => $keyId");
    Domain object = repo.findBy(keyId);
    print("${PropertyChangeConstrains.AFTER_FIND_BY}  => $keyId");
    return object;
  }

  @override
  Domain destroy(Domain objectToDestroy) {
    print("${PropertyChangeConstrains.BEFORE_DESTROY}  => $objectToDestroy");
    repo.destroy(objectToDestroy);
    print("${PropertyChangeConstrains.AFTER_DESTROY}  => $objectToDestroy");
    return objectToDestroy;
  }

  void init() {}

  void dispose() {}

  @override
  int count() {
    return repo.count();
  }
}