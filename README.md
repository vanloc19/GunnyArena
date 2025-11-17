# 🎮 GunnyArena - DDTank 3.0 Game Platform

> Full-stack multiplayer tank battle game platform with microservices architecture, featuring real-time PvP/PvE battles, guild systems, and comprehensive admin tools.

[![License](https://img.shields.io/badge/license-Educational-blue.svg)](LICENSE)
[![.NET](https://img.shields.io/badge/.NET-Framework-blue.svg)](https://dotnet.microsoft.com/)
[![Laravel](https://img.shields.io/badge/Laravel-7.x-red.svg)](https://laravel.com/)
[![Node.js](https://img.shields.io/badge/Node.js-14+-green.svg)](https://nodejs.org/)
[![AWS](https://img.shields.io/badge/AWS-Deployed-orange.svg)](https://aws.amazon.com/)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Components](#-components)
- [Getting Started](#-getting-started---how-to-set-up-your-ddtank-server)
- [Submodules](#-submodules)
- [Development](#-development)
- [Documentation](#-documentation)
- [FAQ - Frequently Asked Questions](#-frequently-asked-questions-faq)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

GunnyArena is a full-stack multiplayer tank battle game platform (DDTank 3.0) consisting of three main components:

- **Client**: Flash-based game client (ActionScript 3.0) with Electron launcher and Laravel web interface
- **Server**: High-performance C# .NET microservices game server with SQL Server database
- **Admin**: Comprehensive admin panel with ASP.NET MVC and Laravel backend

### Key Features

- Real-time multiplayer PvP/PvE battles supporting thousands of concurrent players
- Guild management system with quest progression
- Item management and character progression
- Comprehensive admin tools for game management
- Microservices architecture with scalable design
- RESTful APIs and WebSocket for real-time communication

---

## 🌐 Live Demo

**Website**: [gunnyarena.serveirc.com/](http://gunnyarena.serveirc.com/)

**Test Account**:
- Username: `tovanloc123`
- Password: `tovanlocAz@123`

---

## 📸 Screenshots

Check out these screenshots of the DDTank 3.0 game in action:

![DDTank 3.0 Game Screenshot 1 - Tank Battle Gameplay](Review/1.jpg)
*DDTank 3.0 Tank Battle Gameplay - Real-time multiplayer combat*

![DDTank 3.0 Game Screenshot 2 - Character Selection](Review/2.jpg)
*DDTank 3.0 Character Selection and Customization Screen*

![DDTank 3.0 Game Screenshot 3 - Game Interface](Review/3.jpg)
*DDTank 3.0 Game Interface - HUD and Player Stats*

![DDTank 3.0 Game Screenshot 4 - PvP Battle](Review/4.jpg)
*DDTank 3.0 PvP Battle Mode - Multiplayer Tank Combat*

![DDTank 3.0 Game Screenshot 5 - Admin Panel](Review/5.jpg)
*DDTank 3.0 Admin Panel - Game Management Interface*

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

- ActionScript 3.0 game client (Flash)
- Electron-based desktop launcher
- Laravel web application for player management

**Technologies**: ActionScript 3.0, Electron, Laravel, Node.js, HTML5, CSS3

### 🖥️ Server

**Repository**: [GunnyServer](https://github.com/vanloc19/GunnyServer)

- Microservices architecture (Center, Fighting, Road services)
- Real-time battle logic and room management
- RESTful APIs and WebSocket communication
- Deployed on AWS

**Technologies**: C# .NET Framework 4.8, ASP.NET, SQL Server, WCF Services, AWS

### ⚙️ Admin

**Repository**: [GunnyAdmin](https://github.com/vanloc19/GunnyAdmin)

- ASP.NET MVC admin panel (GM operations)
- Laravel admin interface with comprehensive management tools

**Technologies**: ASP.NET MVC, Laravel, SQL Server, Bootstrap, jQuery

---

## 🚀 Getting Started

### Prerequisites

- .NET Framework 4.7+, PHP 7.4+, Node.js 14+, SQL Server
- Visual Studio (for C# development), Flash Builder (for ActionScript)

### Installation

```bash
# Clone repository with submodules
git clone --recursive https://github.com/vanloc19/GunnyArena.git
cd GunnyArena

# Setup Client
cd Client/Website && composer install && cp .env.example .env && php artisan key:generate

# Setup Admin
cd Admin/Website && composer install && cp .env.example .env && php artisan key:generate

# Setup Server (open GunArena.sln in Visual Studio and build)
cd Server/GameSrc
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

## ❓ Frequently Asked Questions (FAQ) - DDTank Source Code

### Where can I download DDTank 3.0 source code free?

You can download **DDTank 3.0 full source code** for free from this GitHub repository: [github.com/vanloc19/GunnyArena](https://github.com/vanloc19/GunnyArena). Click "Code" → "Download ZIP" to get **complete DDTank source code** as a zip file.

### What is GunnyArena / DDTank 3.0 source code?

**GunnyArena** is the **full source code DDTank 3.0**, a popular multiplayer tank battle game. This repository contains **complete DDTank source code** including **DDTank client source code**, **DDTank server source code**, and **DDTank admin source code** - everything you need to build and run your own **DDTank private server**.

### Is this free DDTank source code download?

Yes! This is **free DDTank source code** that you can download, study, and learn from. The **DDTank 3.0 source code** is provided for educational purposes to help developers understand **DD Tank game development** and game server architecture.

### How to download DDTank source code?

To download **DDTank source code**:
1. Clone the repository: `git clone --recursive https://github.com/vanloc19/GunnyArena.git`
2. Or download as ZIP from GitHub
3. You'll get **complete DDTank source code** including client, server, and admin

### What technologies are used in this DDTank source code?

The **DDTank 3.0 source code** uses:
- **DDTank Client Source**: ActionScript 3.0 (Flash), Electron, Laravel, Node.js
- **DDTank Server Source**: C# .NET Framework, ASP.NET, SQL Server
- **DDTank Admin Source**: ASP.NET MVC, Laravel, SQL Server

### Can I use this DDTank source code for commercial purposes?

This **DDTank source code** is provided for **educational and learning purposes only**. Commercial use requires explicit permission. Please refer to the License section for full details.

### How do I set up my own DDTank private server from source code?

1. Download **DDTank 3.0 source code** from this repository
2. Clone with submodules to get **complete DDTank source code**
3. Setup SQL Server database for **DD Tank game server**
4. Configure **DDTank client source**, **DDTank server source**, and **DDTank admin source**
5. Follow the Getting Started guide above for detailed instructions

### Is this complete DDTank 3.0 full source code?

Yes, this repository contains **full source code DDTank 3.0** for the game client (**DDTank client source code**), server (**DDTank server source code**), and admin panel (**DDTank admin source code**). Some game resources (images, sounds) and database files may need to be configured separately.

### Can I modify and customize this DDTank source code?

Yes, you can study and modify the **DDTank source code** for educational purposes. However, redistribution of modified versions requires proper attribution and adherence to the license terms.

### What version of DDTank is this source code?

This is **DDTank 3.0 full source code**, also known as Gunny or GunnyArena. Complete **DD Tank source code** for version 3.0.

### Where to download DDTank server source code?

The **DDTank server source code** is included in this repository. Download **complete DDTank source code** to get both **DDTank client source** and **DDTank server source**.

### How to get DDTank client source code?

The **DDTank client source code** is included in the Client submodule. Download **full source code DDTank 3.0** to access **DDTank client source code** (ActionScript/Flash).

### Do I need programming experience to use DDTank source code?

Yes, **DDTank source code** requires knowledge of:
- C# .NET programming (for **DDTank server source code**)
- ActionScript/Flash (for **DDTank client source code**)
- PHP/Laravel (for admin websites)
- SQL Server (for **DD Tank database**)
- General software development concepts

### Where can I find DDTank source code documentation?

Each component (**DDTank client source**, **DDTank server source**, **DDTank admin source**) has its own README.md file with detailed documentation. Check the Documentation section above for links.

### Is there support or community for this DDTank source code?

You can contact the developer via the Contact section below, or contribute by opening issues and pull requests on GitHub.

### What makes this different from other DDTank source codes?

This **DDTank 3.0 source code** is a production-ready, enterprise-grade implementation with:
- **Complete DDTank source code** with microservices architecture
- Full documentation for **DDTank game development**
- Modern technologies (.NET, Laravel, Electron)
- Active maintenance
- Comprehensive admin tools

### How to download Gunny source code?

This repository contains **GunnyArena source code** (also known as **Gunny source code**). Download **DDTank 3.0 source code** from this repository to get **complete Gunny source code**.

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

## 🔗 Links & Related Resources - DDTank Source Code Download

### Download DDTank Source Code

- **Main Repository**: [DDTank 3.0 Full Source Code - GunnyArena](https://github.com/vanloc19/GunnyArena) - Download **complete DDTank source code**
- **DDTank Client Source**: [GunnyClient - DDTank Client Source Code](https://github.com/vanloc19/GunnyClient) - **DDTank client source code** download
- **DDTank Server Source**: [GunnyServer - DDTank Server Source Code](https://github.com/vanloc19/GunnyServer) - **DD Tank server source code** download
- **DDTank Admin Source**: [GunnyAdmin - DDTank Admin Source Code](https://github.com/vanloc19/GunnyAdmin) - **DDTank admin panel source code**

### DDTank Source Code Related Links

- **Live Demo**: [gunnyarena.serveirc.com/](https://gunnyarena.serveirc.com/) - Test **DDTank private server**

### Popular Search Terms for DDTank Source Code

Looking for: **DDTank source code** | **DDTank 3.0 source code** | **DD Tank source code** | **Gunny source code** | **GunnyArena source code** | **DDTank 3.0 full source** | **Free DDTank code** | **DD Tank server code** | **DDTank game development** | **DDTank client source code** | **DDTank server source code** | **DDTank admin source code** | **DDTank private server** | **Download DDTank source code** | **Complete DDTank source code**

---

## 📞 Contact

For questions, suggestions, or inquiries, please contact:

- **Email**: [tovanloc19@gmail.com](mailto:tovanloc19@gmail.com)
- **Facebook**: [vanloc19](https://www.facebook.com/vanloc1963/)

---

**Built with ❤️ for the developer community**

*Download **DDTank 3.0 full source code** free from this repository. Get **complete DDTank source code** including **GunnyArena source code** and **DD Tank game server source code**. Perfect for **DDTank game development**, **DDTank private server** creation, and learning game server architecture. This **DDTank source code** includes **DDTank client source code** (ActionScript/Flash), **DDTank server source code** (C# .NET), and **DDTank admin source code** (Laravel/ASP.NET MVC). Whether you're looking for **DDTank source code download**, **DD Tank source code free**, **Gunny source code**, **DDTank 3.0 source**, **free DDTank code**, or **complete DDTank source** - this repository provides everything you need for **DDTank game development** and building your own **DDTank private server**.*

