class Survey {
  String name;
  String description;

  Survey(this.name, this.description) {
    if (name == null) {
      throw new ArgumentError("name of Survey cannot be null. "
          "Received: '$name'");
    }
    if (description == null) {
      throw new ArgumentError("description of Survey cannot be null. "
          "Received: '$description'");
    }
  }
}
