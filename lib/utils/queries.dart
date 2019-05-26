String foodsQuery = """
   query foods(\$tags: [String]) {
    foods(tags: \$tags) {
      id
      name
      tags
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
