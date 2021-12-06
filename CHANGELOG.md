* 1.1.2-SNAPSHOT.20211206:
  * **BUG FIX** :bug: : Fix bug in `DefaultReadUseCase`, Fix extends to `ReadUseCase<Domain>` instead of CRUD.

* 1.1.1-SNAPSHOT.20211206:
  * **IMPROVEMENT** Rename `docs` folder to `doc` to avoid flutter pug publish warning .
  * **IMPROVEMENT** Fix description length btw [60,180] chars in pubspec.yaml to score in Dart file conventions at pub.dev.
  * **IMPROVEMENT** Added the `ReadUseCase` and `DefaultReadUseCase` to abstract to the general logic of the UseCase the scenario when exists a single list with inmutables object

* 1.1.0-RELEASE.20211017:
  * **BUG FIX** :bug: : [Issue **#1**](https://github.com/JesusHdezWaterloo/clean-core-flutter/issues/1) solved : Fixed images in README.md.
  * **IMPROVEMENT** :+1: : [Issue **#4**](https://github.com/JesusHdezWaterloo/clean-core-flutter/issues/4) solved : Agregar exporters al ejemplo.
  * **BREAKING** :hammer: : Camel Typo: `externalRepo` to lowercase in [app/repo/DefaultCRUDRepo.dart](https://github.com/JesusHdezWaterloo/clean-core-flutter/blob/develop/lib/src/app/repo/DefaultCRUDRepo.dart).
  * **IMPROVEMENT** :+1: : Fix Scores of pub.dev. format the code, follow Dart file conventions. Missing docs because error running dartdoc.

* 1.0.1-RELEASE.20211011: Documentation.
  * **IMPROVEMENT** Added documentation to README.md and this CHANGELOG.md.

* 1.0.0.SNAPSHOT.20211003: Initial develop of framework.
  * **NEW** Basics of Domain, Entities, Repo, Use Case.