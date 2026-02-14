import 'dart:ui';

import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String title;
  final String bio;
  final String subBio;

  const Profile({
    required this.name,
    required this.title,
    required this.bio,
    required this.subBio,
  });

  @override
  List<Object> get props => [name, title, bio, subBio];
}

class Experience extends Equatable {
  final String company;
  final String role;
  final String duration;
  final String description;
  final List<String> technologies;

  final String? metric;
  final String? logo;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    required this.technologies,
    this.metric,
    this.logo,
  });

  @override
  List<Object?> get props => [
    company,
    role,
    duration,
    description,
    technologies,
    metric,
    logo,
  ];
}

class Skill extends Equatable {
  final String name;
  final String purpose;
  final String category; // Backend, Mobile, Strategy
  final double proficiency; // 0.0 to 1.0

  const Skill({
    required this.name,
    required this.purpose,
    required this.category,
    required this.proficiency,
  });

  @override
  List<Object> get props => [name, purpose, category, proficiency];
}

class Stat extends Equatable {
  final String label;
  final String value;
  final String description;
  final Color descriptionColor;

  const Stat({
    required this.label,
    required this.value,
    required this.description,
    required this.descriptionColor,
  });

  @override
  List<Object> get props => [label, value, description, descriptionColor];
}

class PortfolioData extends Equatable {
  final Profile profile;
  final List<Experience> experiences;
  final List<Skill> skills;
  final List<Stat> stats;

  const PortfolioData({
    required this.profile,
    required this.experiences,
    required this.skills,
    required this.stats,
  });

  @override
  List<Object> get props => [profile, experiences, skills, stats];
}
