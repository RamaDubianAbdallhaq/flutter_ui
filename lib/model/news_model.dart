import 'package:meta/meta.dart';
import 'dart:convert';

class NewsModel {
    final Source? source;
    final String? author;
    final String? title;
    final String? description;
    final String? url;
    final String? urlToImage;
    final String? publishedAt;
    final String? content;

    NewsModel({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    NewsModel copyWith({
        Source? source,
        String? author,
        String? title,
        String? description,
        String? url,
        String? urlToImage,
        String? publishedAt,
        String? content,
    }) => 
        NewsModel(
            source: source ?? this.source,
            author: author ?? this.author,
            title: title ?? this.title,
            description: description ?? this.description,
            url: url ?? this.url,
            urlToImage: urlToImage ?? this.urlToImage,
            publishedAt: publishedAt ?? this.publishedAt,
            content: content ?? this.content,
        );

    factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        source: Source.fromMap(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
    );

    Map<String, dynamic> toMap() => {
        "source": source!.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
    };
}

class Source {
    final dynamic id;
    final String name;

    Source({
        required this.id,
        required this.name,
    });

    Source copyWith({
        dynamic id,
        String? name,
    }) => 
        Source(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}