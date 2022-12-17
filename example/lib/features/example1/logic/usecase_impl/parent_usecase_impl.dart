import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentUseCaseImpl extends DelegatedCRUDUseCase<ParentDomain, ParentRepo>
    implements ParentUseCase {
  ParentUseCaseImpl(ParentRepo repo) : super(repo: repo);

  @override
  String doStuffInUseCase() {
    return "Doing Stuff in Use Case";
  }

  @override
  String doStuffDeeper() {
    return repo.doStuffDeeper();
  }
}
