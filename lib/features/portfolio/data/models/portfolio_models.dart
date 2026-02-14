import '../../domain/entities/portfolio_entities.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.title,
    required super.bio,
    required super.subBio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      title: json['title'],
      bio: json['bio'],
      subBio: json['subBio'],
    );
  }
}

class ExperienceModel extends Experience {
  const ExperienceModel({
    required super.company,
    required super.role,
    required super.duration,
    required super.description,
    required super.technologies,
    super.metric,
    super.logo,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      company: json['company'],
      role: json['role'],
      duration: json['duration'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      metric: json['metric'],
      logo: json['logo'],
    );
  }
}

class SkillModel extends Skill {
  const SkillModel({
    required super.name,
    required super.purpose,
    required super.category,
    required super.proficiency,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      purpose: json['purpose'],
      category: json['category'],
      proficiency: json['proficiency'],
    );
  }
}

class StatModel extends Stat {
  const StatModel({
    required super.label,
    required super.value,
    required super.description,
    required super.descriptionColor,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      label: json['label'],
      value: json['value'],
      description: json['description'],
      descriptionColor: json['description_color'],
    );
  }
}

class PortfolioModel extends PortfolioData {
  const PortfolioModel({
    required ProfileModel super.profile,
    required List<ExperienceModel> super.experiences,
    required List<SkillModel> super.skills,
    required List<StatModel> super.stats,
  });
}
