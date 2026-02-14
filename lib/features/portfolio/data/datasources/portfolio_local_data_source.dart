import 'package:flutter/material.dart';
import 'package:portfolio_app/core/theme/app_colors.dart';

import '../models/portfolio_models.dart';

abstract class PortfolioLocalDataSource {
  Future<PortfolioModel> getPortfolioData();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<PortfolioModel> getPortfolioData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Static data representing the JSON structure
    final Map<String, dynamic> data = {
      "profile": {
        "name": "Jonathan Mark Mwigo",
        "title": "Senior Mobile & Backend Lead",
        "bio": "I Build Systems That Scale and Teams That Last.",
        "subBio":
        "Senior Mobile & Backend Lead specializing in high-throughput JVM architectures, Rust systems, and reactive UIs.",
      },
      "experiences": [
        {
          "company": "Hyde Innovations",
          "role": "Senior Lead Mobile & Backend",
          "duration": "2023 - PRESENT",
          "description":
          "Architecting mission-critical infrastructure using Kotlin, Flutter, and Rust(Axum). Focused on creating resilient backend systems that support low-latency mobile interactions.",
          "technologies": ["South/Axum", "Kafka", "Flutter", "PostgreSQL"],
          "metric":
          null,
          // No specific metric shown in design for this one, or maybe it's the 38% one? Let's check the design.
          // Wait, the design shows "38% EVALUATION" for Infosec Technologies.
          "logo": "assets/hyde_innovations.png",
        },
        {
          "company": "Infosec Technologies",
          "role": "Lead Developer",
          "duration": "2019 - 2023",
          "description":
          "Managed a 10-person core development team. Reduced production bugs by 30% via CI/CD pipelines.",
          "technologies": ["Java", "Spring Boot", "React"],
          "metric": "38%\nEVALUATION",
          "logo": "assets/infosec.png",
        },
        {
          "company": "Netify IT",
          "role": "Mobile Application Consultant",
          "duration": "2018 - 2019",
          "description":
          "Revitalized legacy mobile applications. Spearheaded the migration to a modern reactive architecture, resulting in massive engagement gains.",
          "technologies": ["Android", "Kotlin", "Firebase"],
          "metric": "40%\nINCREASED DAU",
          "logo": "assets/netify.png",
        },
      ],
      "skills": [
        {
          "name": "Rust",
          "purpose": "Systems Performance",
          "category": "Backend Systems",
          "proficiency": 0.80
        },
        {
          "name": "Java / JVM",
          "purpose": "Architecture",
          "category": "Backend Systems",
          "proficiency": 0.95,
        },
        {
          "name": "SQL (Postgres)",
          "purpose": "Optimization",
          "category": "Backend Systems",
          "proficiency": 0.85,
        },
        {
          "name": "Kotlin",
          "purpose": "Native Mobile",
          "category": "Mobile / Frontend",
          "proficiency": 0.80,
        },
        {
          "name": "Flutter",
          "purpose": "Cross-Platform",
          "category": "Mobile / Frontend",
          "proficiency": 0.95,
        },
        {
          "name": "JavaFX",
          "purpose": "Reactive UIs",
          "category": "Mobile / Frontend",
          "proficiency": 0.80,
        },
      ],
      "stats": [
        {
          "label": "EFFICIENCY INCREASE",
          "value": "20%",
          "description": "CORE_PERF_V2",
          "description_color": AppColors.statsCardBlue,
        },
        {
          "label": "REQ / MINUTE",
          "value": "10,000+",
          "description": "SYS_THROUGHPUT",
          "description_color": AppColors.statsCardOrange,
        },
        {
          "label": "DEV INCREASE",
          "value": "40%",
          "description": "USER_ENGAGEMENT",
          "description_color": AppColors.statsCardBlue,
        },
      ],
    };

    return PortfolioModel(
      profile: ProfileModel.fromJson(data['profile']),
      experiences: (data['experiences'] as List)
          .map((e) => ExperienceModel.fromJson(e))
          .toList(),
      skills: (data['skills'] as List)
          .map((e) => SkillModel.fromJson(e))
          .toList(),
      stats: (data['stats'] as List).map((e) => StatModel.fromJson(e)).toList(),
    );
  }
}
