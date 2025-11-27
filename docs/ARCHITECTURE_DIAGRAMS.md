# MoviesTCA Architecture Diagrams

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                          Application Entry                           │
│                         (MoviesTCAApp.swift)                         │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         App Root Feature                             │
│                    (TCA Reducer + State)                             │
│  ┌─────────┬──────────┬─────────────┬──────────────┐               │
│  │ Explore │  Movies  │  TV Series  │    People    │               │
│  │  Root   │   Root   │    Root     │     Root     │               │
│  └────┬────┴─────┬────┴──────┬──────┴───────┬──────┘               │
└───────┼──────────┼───────────┼──────────────┼──────────────────────┘
        │          │           │              │
        ▼          ▼           ▼              ▼
┌─────────────────────────────────────────────────────────────────────┐
│                          Feature Layer                               │
│        (Individual Feature Modules - TCA Based)                      │
│                                                                      │
│  ExploreFeature  MovieDetailsFeature  TrendingMoviesFeature         │
│  PersonDetailsFeature  TVSeriesDetailsFeature  etc.                 │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         Adapter Layer                                │
│     (Bridge between TCA Dependencies and Domain Use Cases)           │
│                                                                      │
│  MoviesAdapters  TVAdapters  PeopleAdapters  TrendingAdapters       │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                       Application Layer                              │
│              (Use Cases + Business Logic)                            │
│                                                                      │
│  MoviesApplication  TVApplication  PeopleApplication                │
│  TrendingApplication  ConfigurationApplication                      │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         Domain Layer                                 │
│          (Entities + Repository Interfaces)                          │
│                                                                      │
│  MoviesDomain  TVDomain  PeopleDomain                               │
│  TrendingDomain  CoreDomain                                         │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    Infrastructure Layer                              │
│         (Repository Implementations + Data Sources)                  │
│                                                                      │
│  MoviesInfrastructure  TVInfrastructure  PeopleInfrastructure       │
│  TrendingInfrastructure  ConfigurationInfrastructure                │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                      External Services                               │
│                                                                      │
│  TMDb API (The Movie Database)                                      │
│  via TMDb SDK (https://github.com/adamayoung/TMDb)                  │
└─────────────────────────────────────────────────────────────────────┘
```

## Module Structure Overview

The application is organized into four main categories:

1. **App**: Main application entry point and root features
2. **Features**: UI feature modules (TCA-based)
3. **Kits**: Domain business logic (Clean Architecture)
4. **Adapters**: Bridge between TCA and domain layer
5. **Core**: Shared components (Design System, Core Domain)

## Data Flow Example

See ARCHITECTURE_REVIEW.md for detailed data flow diagrams.
