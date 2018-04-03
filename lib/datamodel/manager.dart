class Manager {
    String name;
    String description;

    Manager(this.name, this.description) {
      if (name == null) {
        throw new ArgumentError("name of Manager cannot be null. "
            "Received: '$name'");
      }
      if (description == null) {
        throw new ArgumentError("description of Manager cannot be null. "
            "Received: '$description'");
      }
    }
  }