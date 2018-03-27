class Store {
  final String name;
  final String description;

  Store(this.name, this.description) {
    if (name == null) {
      throw new ArgumentError("name of Store cannot be null. "
          "Received: '$name'");
    }
    if (description == null) {
      throw new ArgumentError("description of Store cannot be null. "
          "Received: '$description'");
    }
  }
}