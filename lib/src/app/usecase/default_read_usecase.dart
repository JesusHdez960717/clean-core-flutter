import 'package:clean_core/clean_core.dart';

///Default implementation of [CRUDUseCase] of type Domain extends
///[BasicDomainObject]
///It's basically a delegate to the repo.
///
/// EXAMPLE:
/// This is the implementation of ParentUseCase.
/// See [BasicDomainObject] for ParentDomain's example code.
/// See [ReadUseCase] for ParentUseCase's example code.
/// ```dart
///   class ParentUseCaseImpl extends DefaultReadUseCase<ParentDomain>
///     implements ParentUseCase {
///
///     ParentUseCaseImpl(List<ParentDomain> info)
///         : super(info: info);
///
///     void doStuffInUseCase(){
///        print('Doing Stuff in the use case layer...');
///     }
///   }
/// ```
abstract class DefaultReadUseCase<Domain extends BasicDomainObject<Domain>>
    extends ReadUseCase<Domain> {
  List<Domain> _info;

  DefaultReadUseCase(this._info);

  @override
  List<Domain> findAll() {
    print("${PropertyChangeConstrains.BEFORE_FIND_ALL}  => $_info");

    List<Domain> list = _info.map((e) => e.clone()).toList();

    print("${PropertyChangeConstrains.AFTER_FIND_ALL}  => $list");
    return list;
  }

  @override
  Domain findBy(int keyId) =>
      _info.firstWhere((element) => element.id == keyId).clone();

  @override
  int count() => _info.length;

  @override
  void init() {}

  @override
  void dispose() {}
}
