class Food {
  final String id;
  final String name;
  final String url;
  final List<String> tags;

  Food({this.id, this.name, this.url, this.tags});

  factory Food.fromJson(Map<String, dynamic> json) => new Food(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        tags: new List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "tags": new List<dynamic>.from(tags.map((x) => x)),
      };
}
