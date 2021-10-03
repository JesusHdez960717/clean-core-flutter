
class ObjectBoxExampleRepoModule {
  static late final ParentRepo PARENT_REPO;

  //static late final ChildRepo CHILD_REPO;

  static Future<Store> init() async {
    Store store = await openStore().then((value) {
      STORE = value;
      PARENT_REPO = ParentRepoImpl(STORE);
      //CHILD_REPO = ChildRepoImpl();
      return value;
    });
    return store;
  }

  static void dispose() {
    STORE.close();
  }
}
