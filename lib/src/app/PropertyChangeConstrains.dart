class PropertyChangeConstrains{
  //-----------------------    For CRUD    -----------------------\\
  //create
  static const String BEFORE_CREATE = "before_create";
  static const String AFTER_CREATE = "after_create";

  //edit
  static const String BEFORE_EDIT = "before_edit";
  static const String AFTER_EDIT = "after_edit";

  //destroy
  static const String BEFORE_DESTROY = "before_destroy";
  static const String AFTER_DESTROY = "after_destroy";

  //destroyById
  static const String BEFORE_DESTROY_BY_ID = "before_destroyById";
  static const String AFTER_DESTROY_BY_ID = "after_destroyById";

  //findBy
  static const String BEFORE_FIND_BY = "before_findBy";
  static const String AFTER_FIND_BY = "after_findBy";

  //findAll
  static const String BEFORE_FIND_ALL = "before_findAll";
  static const String AFTER_FIND_ALL = "after_findAll";

  //count
  static const String BEFORE_COUNT = "before_count";
  static const String AFTER_COUNT = "after_count";

  //-----------------------    For Read/Write    -----------------------\\
  //read
  static const String BEFORE_READ = "before_read";
  static const String AFTER_READ = "after_read";

  //write
  static const String BEFORE_WRITE = "before_write";
  static const String AFTER_WRITE = "after_write";

}
/*
enum PropertyChangeConstrains{
  //-----------------------    For CRUD    -----------------------\\
  //create
  BEFORE_CREATE,
  AFTER_CREATE,

  //edit
  BEFORE_EDIT,
  AFTER_EDIT,

  //destroy
  BEFORE_DESTROY,
  AFTER_DESTROY,

  //destroyById
  BEFORE_DESTROY_BY_ID,
  AFTER_DESTROY_BY_ID,

  //findBy
  BEFORE_FIND_BY,
  AFTER_FIND_BY,

  //findAll
  BEFORE_FIND_ALL,
  AFTER_FIND_ALL,

  //count
  BEFORE_COUNT,
  AFTER_COUNT,

  //-----------------------    For Read/Write    -----------------------\\
  //read
  BEFORE_READ,
  AFTER_READ,

  //write
  BEFORE_WRITE,
  AFTER_WRITE,

}*/