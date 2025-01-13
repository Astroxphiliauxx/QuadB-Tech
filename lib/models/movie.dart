class Movie {
  final double? score;
  final Show? show;

  Movie({this.score, this.show});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      score: json['score'],
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'score': score,
    'show': show?.toJson(),
  };
}

class Show {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final Externals? externals;
  final MovieImage? image;
  final String? summary;
  final Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.externals,
    this.image,
    this.summary,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'],
      language: json['language'],
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'],
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered: json['premiered'],
      officialSite: json['officialSite'],
      schedule: json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'],
      network: json['network'] != null ? Network.fromJson(json['network']) : null,
      externals: json['externals'] != null ? Externals.fromJson(json['externals']) : null,
      image: json['image'] != null ? MovieImage.fromJson(json['image']) : null,
      summary: json['summary'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'name': name,
    'type': type,
    'language': language,
    'genres': genres,
    'status': status,
    'runtime': runtime,
    'averageRuntime': averageRuntime,
    'premiered': premiered,
    'officialSite': officialSite,
    'schedule': schedule?.toJson(),
    'rating': rating?.toJson(),
    'weight': weight,
    'network': network?.toJson(),
    'externals': externals?.toJson(),
    'image': image?.toJson(),
    'summary': summary,
    '_links': links?.toJson(),
  };
}

class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: List<String>.from(json['days'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'time': time,
    'days': days,
  };
}

class Rating {
  final double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'average': average,
  };
}

class Network {
  final int? id;
  final String? name;
  final Country? country;

  Network({this.id, this.name, this.country});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'country': country?.toJson(),
  };
}

class Country {
  final String? name;
  final String? code;
  final String? timezone;

  Country({this.name, this.code, this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'timezone': timezone,
  };
}

class Externals {
  final String? imdb;

  Externals({this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      imdb: json['imdb'],
    );
  }

  Map<String, dynamic> toJson() => {
    'imdb': imdb,
  };
}

class MovieImage {
  String? medium;
  String? original;

  MovieImage({this.medium, this.original});

  MovieImage.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}


class Links {
  final String? self;

  Links({this.self});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self']?['href'],
    );
  }

  Map<String, dynamic> toJson() => {
    'self': self,
  };
}
