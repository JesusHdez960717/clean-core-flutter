import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:clean_core_example/clean_core_example.dart';

class ParentUseCaseImpl extends DefaultCRUDUseCase<ParentDomain>
    implements ParentUseCase {
  late ParentRepo _repo;

  ParentUseCaseImpl(ParentRepo repo)
      : _repo = repo,
        super(repo: repo);

  @override
  String doStuffInUseCase() {
    return "Doing Stuff in Use Case";
  }

  @override
  String doStuffDeeper() {
    return _repo.doStuffDeeper();
  }
}
