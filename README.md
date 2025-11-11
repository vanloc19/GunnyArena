# 🎮 GunnyArena

> Enterprise-grade multiplayer tank battle game platform with microservices architecture

[![License](https://img.shields.io/badge/license-Educational-blue.svg)](LICENSE)
[![.NET](https://img.shields.io/badge/.NET-Framework-blue.svg)](https://dotnet.microsoft.com/)
[![Laravel](https://img.shields.io/badge/Laravel-7.x-red.svg)](https://laravel.com/)
[![Node.js](https://img.shields.io/badge/Node.js-14+-green.svg)](https://nodejs.org/)

GunnyArena is a comprehensive, production-ready game platform featuring a distributed microservices architecture, real-time multiplayer battles, and a complete admin management system. Built with modern technologies including C# .NET, Laravel, Electron, and ActionScript.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Components](#-components)
- [Getting Started](#-getting-started)
- [Submodules](#-submodules)
- [Development](#-development)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

GunnyArena is a full-stack game platform consisting of three main components:

- **Client**: Flash-based game client with Electron launcher and Laravel web interface
- **Server**: High-performance C# .NET microservices game server
- **Admin**: Comprehensive admin panel with ASP.NET MVC and Laravel backend

The platform supports thousands of concurrent players with real-time PvP/PvE battles, guild systems, quest progression, item management, and extensive admin tools.

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        GunnyArena Platform                       │
└────────────────────────────┬────────────────────────────────────┘
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
   ┌────▼────┐         ┌─────▼─────┐      ┌─────▼─────┐
   │ Client  │         │  Server   │      │   Admin   │
   │         │         │           │      │           │
   │ • Flash │◄────────┤ • Center  │◄─────┤ • GM      │
   │ • Web   │         │ • Fighting│      │   Service │
   │ • Launch│         │ • Road    │      │ • Website │
   └─────────┘         └─────┬─────┘      └───────────┘
                             │
                    ┌────────▼────────┐
                    │   SQL Database  │
                    └─────────────────┘
```

### Key Features

- **Microservices Architecture**: Scalable, distributed server design
- **Real-time Multiplayer**: Low-latency battle system
- **Cross-platform Client**: Flash game with Electron launcher
- **Comprehensive Admin Tools**: Full game management and monitoring
- **Production Ready**: Battle-tested architecture supporting high concurrency

---

## 📁 Project Structure

```
GunnyArena/
├── Client/              # Client submodule
│   ├── FlashbaseSrc/    # ActionScript game source
│   ├── launcher/        # Electron launcher
│   └── Website/         # Laravel client website
│
├── Server/              # Server submodule
│   ├── GameSrc/         # C# .NET game server source
│   ├── Output/          # Compiled server binaries
│   └── Web/             # Web services and resources
│
├── Admin/               # Admin submodule
│   ├── GM/              # ASP.NET MVC admin service
│   └── Website/         # Laravel admin website
│
├── Database/            # Database backup files
├── Tools/               # Development and deployment tools
├── Docs/                # Project documentation
└── FLA/                 # Flash source files
```

---

## 🧩 Components

### 🎮 Client

**Repository**: [GunnyClient](https://github.com/vanloc19/GunnyClient)

- **FlashbaseSrc**: ActionScript 3.0 game client source code
- **Launcher**: Electron-based desktop launcher with auto-update
- **Website**: Laravel web application for client registration and management

**Technologies**: ActionScript 3.0, Electron, Laravel, Node.js

### 🖥️ Server

**Repository**: [GunnyServer](https://github.com/vanloc19/GunnyServer)

- **Center Service**: Central server management and authentication
- **Fighting Service**: Real-time battle logic and room management
- **Road Service**: Game progression and quest system
- **Web Services**: RESTful APIs and resource management

**Technologies**: C# .NET Framework, ASP.NET, SQL Server

### ⚙️ Admin

**Repository**: [GunnyAdmin](https://github.com/vanloc19/GunnyAdmin)

- **GM Service**: ASP.NET MVC admin panel for game management
- **Website**: Laravel admin interface with comprehensive tools

**Technologies**: ASP.NET MVC, Laravel, SQL Server

---

## 🚀 Getting Started

### Prerequisites

- **Git** with submodule support
- **.NET Framework** 4.7+ (for Server and Admin GM)
- **PHP** 7.4+ and **Composer** (for Laravel websites)
- **Node.js** 14+ and **npm** (for Electron launcher)
- **SQL Server** (for database)
- **Flash Builder** or compatible IDE (for ActionScript development)

### Installation

1. **Clone the repository with submodules:**

```bash
git clone --recursive https://github.com/vanloc19/GunnyArena.git
cd GunnyArena
```

If you've already cloned without `--recursive`, initialize submodules:

```bash
git submodule init
git submodule update
```

2. **Setup Client:**

```bash
cd Client/Website
composer install
cp .env.example .env
php artisan key:generate
```

3. **Setup Server:**

```bash
cd Server/GameSrc
# Open GunArena.sln in Visual Studio
# Restore NuGet packages
# Build solution
```

4. **Setup Admin:**

```bash
cd Admin/Website
composer install
cp .env.example .env
php artisan key:generate
```

5. **Configure Database:**

- Restore database backups from `Database/` folder
- Update connection strings in configuration files

### Quick Start

Use the provided startup scripts:

```bash
# Development mode
start_dev.bat

# Production mode
start.bat
```

---

## 📦 Submodules

This repository uses Git submodules to manage the three main components:

| Submodule | Repository | Description |
|-----------|-----------|-------------|
| **Client** | [GunnyClient](https://github.com/vanloc19/GunnyClient) | Game client, launcher, and web interface |
| **Server** | [GunnyServer](https://github.com/vanloc19/GunnyServer) | Game server microservices |
| **Admin** | [GunnyAdmin](https://github.com/vanloc19/GunnyAdmin) | Admin panel and management tools |

### Working with Submodules

**Update all submodules to latest:**

```bash
git submodule update --remote
```

**Update specific submodule:**

```bash
git submodule update --remote Client
```

**Commit submodule changes:**

```bash
cd Client
git add .
git commit -m "Your commit message"
git push
cd ..
git add Client
git commit -m "Update Client submodule"
```

---

## 💻 Development

### Development Workflow

1. **Create a feature branch:**

```bash
git checkout -b feature/your-feature-name
```

2. **Make changes in respective submodules:**

```bash
cd Client  # or Server, or Admin
# Make your changes
git add .
git commit -m "Add feature X"
git push
```

3. **Update main repository:**

```bash
cd ..
git add Client  # or Server, or Admin
git commit -m "Update Client submodule"
git push
```

### Code Style

- **C#**: Follow Microsoft C# coding conventions
- **PHP**: Follow PSR-12 coding standards
- **JavaScript**: Follow ESLint configuration
- **ActionScript**: Follow Adobe ActionScript style guide

### Testing

Each component has its own testing setup:

- **Server**: Unit tests in `GameSrc/`
- **Client Website**: PHPUnit tests in `Client/Website/tests/`
- **Admin Website**: PHPUnit tests in `Admin/Website/tests/`

---

## 📚 Documentation

Detailed documentation for each component:

- [Client Documentation](Client/README.md)
- [Server Documentation](Server/README.md)
- [Admin Documentation](Admin/README.md)

Additional documentation available in `Docs/` directory.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Commit Message Guidelines

- Use clear, descriptive commit messages in English
- Follow conventional commit format when possible
- Reference issue numbers if applicable

---

## 📄 License

**Educational & Learning Purpose - Non-Commercial**

This project is released for **educational and learning purposes only**. The purpose of this release is to help developers learn and understand the project structure and folder organization of the Gunny game platform.

### Terms of Use

- ✅ **Allowed**: Study, learn, and understand the code structure
- ✅ **Allowed**: Use as a reference for educational purposes
- ❌ **Prohibited**: Commercial use without explicit permission
- ❌ **Prohibited**: Redistribution for commercial purposes
- ❌ **Prohibited**: Unauthorized modification and distribution

### Game Resources

- Game resources (images, sounds, assets) are sourced from China
- Resource files are not included in this repository
- All code implementations are original work by the developer

### Important Restrictions

**To prevent abuse and unauthorized sale of source code, the following items are NOT provided:**

- ❌ **Database**: Database files and schemas are not included
- ❌ **Game Resources**: Resource files (images, sounds, assets) are not shared
- ❌ **Complete Source**: Some critical components may be excluded

**Reason**: These restrictions are in place to prevent misuse and unauthorized commercial distribution of the source code. This repository is intended for **educational purposes only** - to help developers understand project structure and architecture, not to provide a complete, runnable system.

**This is a learning resource, not a commercial product.**

### Copyright

**Proprietary - All Rights Reserved**

Copyright © 2024 vanloc19. All rights reserved.

This software and associated documentation files (the "Software") are the proprietary property of vanloc19.

---

## 👥 Team

Developed and maintained by **vanloc19**.

---

## 🔗 Links

- **Client Repository**: [GunnyClient](https://github.com/vanloc19/GunnyClient)
- **Server Repository**: [GunnyServer](https://github.com/vanloc19/GunnyServer)
- **Admin Repository**: [GunnyAdmin](https://github.com/vanloc19/GunnyAdmin)

---

## 📞 Contact

For questions, suggestions, or inquiries, please contact:

- **Email**: [tovanloc19@gmail.com](mailto:tovanloc19@gmail.com)
- **Facebook**: [vanloc19](https://www.facebook.com/vanloc1963/)

---

**Built with ❤️ for the developer community**

*This project serves as a comprehensive reference for understanding enterprise-level game platform architecture, microservices design, and professional project organization.*

