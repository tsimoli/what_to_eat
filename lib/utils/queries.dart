String foodsQuery = """
   query foods(\$tags: [String]) {
    foods(tags: \$tags) {
      id
      name
    }
   }
""";

String createFood = """
mutation createFood(\$input: CreateFoodInput!) {
    createFood(input: \$input) {
      errors { key message }
      food {
        id
      }
    }
  }
""";
