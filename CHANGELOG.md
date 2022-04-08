* 1.3.3-RELEASE.20220407:
    * **IMPROVEMENT** :raised_hands: : Upgrade Gradle/Kotlin plugin versions.
    * **IMPROVEMENT** :raised_hands: : Fix plugin version, skip `1.3.1-RELEASE.20220407` & `1.3.2-RELEASE.20220407`.

* 1.3.0-RELEASE.20220407:
    * **NEW** :+: : Created architecture for Async operations.
    * **NEW** :+: : Created JSONConverter for entities.
    * **IMPROVEMENT** :raised_hands: : Removed `DefaultGeneralConverter`, use instead `GeneralConverter`.
    * **IMPROVEMENT** :raised_hands: : Created `destroyById`, & `destroy` with void return value.
    * **IMPROVEMENT** :raised_hands: : Added `CRUDRepo` to type param in `CRUDUseCase` and `CRUDRepoExternal` in `CRUDRepo` for auto cast.

* 1.2.3-RELEASE.20220206:
    * **BUG FIX** :bug: : Fix version number in Changelog.md

* 1.2.2-RELEASE.20220206:
  * **BUG FIX** :bug: : [Issue **#16**](https://github.com/JesusHdezWaterloo/clean-core-flutter/issues/16) solved :Removed all unnecessary print
  * **IMPROVEMENT** : [Issue **#15**](https://github.com/JesusHdezWaterloo/clean-core-flutter/issues/15) solved : Implemented a default version of `operator ==` in `BasicDomainObject`, comparing the two domains by it's type and id's

* 1.2.1-SNAPSHOT.20220116:
  * **BUG FIX** :bug: : Fix CHANGELOG

* 1.2.0-SNAPSHOT.20220116:
  * **IMPROVEMENT** : [Issue **#14**](https://github.com/JesusHdezWaterloo/clean-core-flutter/issues/14) solved : Removed converter from entity, the responsability of convert an entity into a domain and vice versa if of the GeneralConverter, not the entity itself.

* 1.1.3-SNAPSHOT.20220109:
  * **IMPROVEMENT** : Added clone() for `BasicDomainObject` and enforce it in DefaultReadUseCase.
  * **IMPROVEMENT** : Added init() and dispose() in UseCases and Repos and it's default empty implementation.
  * **IMPROVEMENT** : Rename all files to lowercase.
  * **IMPROVEMENT** : Added dartdoc support and fixed (suppose) all pub points.
  * **IMPROVEMENT** : Fixed example with changes.

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