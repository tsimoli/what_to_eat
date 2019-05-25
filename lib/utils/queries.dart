String foodsQuery = """
   query foods(\$tags: [String]) {
    foods(tags: \$tags) {
      id
      name
    }
   }
""";
