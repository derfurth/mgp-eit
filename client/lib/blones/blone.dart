class Blone {
  Future<void> mount() async {
    return;
  }

  void seed() {}

  void dispose() {}
}

mixin ParentBlone implements Blone {
  final _children = [];

  T child<T>() => _children.whereType<T>().first;
  Iterable<T> children<T>() => _children.whereType<T>();

  /// Initialize [children].
  void initialize(Iterable children) {
    _children.addAll(children);
    children.whereType<ChildBlone>().forEach((child) {
      child.parent = this;
      child.onInit();
      child.seed();
    });
  }

  @override
  Future<void> mount() async {
    for (final blone in _children.whereType<Blone>()) {
      await blone.mount();
    }
  }

  @override
  void seed() {
    for (final blone in _children.whereType<Blone>()) {
      blone.seed();
    }
  }

  @override
  void dispose() {
    final kids = _children.whereType<Blone>().toList();
    for (final blone in kids) {
      blone.dispose();
    }
    _children.clear();
    if (this is ChildBlone) {
      final parent = (this as ChildBlone).parent;
      if (parent._children.contains(this)) {
        parent._children.remove(this);
      }
    }
  }
}

mixin ChildBlone<P extends ParentBlone> implements Blone {
  late final P parent;

  void onInit() {}

  @override
  Future<void> mount() async {
    return;
  }

  @override
  void seed() {}

  @override
  void dispose() {
    if (parent._children.contains(this)) {
      parent._children.remove(this);
    }
  }
}
