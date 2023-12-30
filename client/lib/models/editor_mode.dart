enum EditorMode {
  create,
  update,
  viewOnly,
}

class EditorParams {
  final EditorMode mode;
  final bool embedded;

  EditorParams({
    required this.mode,
    this.embedded = false,
  });
}
