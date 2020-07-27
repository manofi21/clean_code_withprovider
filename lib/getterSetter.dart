class Valid {
  GetASet parts;
  Valid(this.parts);
  Function saver(String auto) {
    parts.str_name = auto;
  }
}

class GetASet {
  String str;
  String get str_name {
    return str;
  }

  void set str_name(String name) {
    this.str = name;
  }
}
