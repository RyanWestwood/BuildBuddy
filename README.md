# BuildBuddy
<p align="center">
  <img src="https://user-images.githubusercontent.com/55410510/230521922-f843f5fe-e611-461b-bf37-99f0dc22e4cf.png" alt="BuildBuddy Logo">
</p>
BuildBuddy is a streamlined solution that provides custom Windows and Linux images and containers for self-hosted GitHub Actions. Our primary focus is on C/C++ projects utilizing CMake, Ninja, MSVC, GCC, and Clang. BuildBuddy enhances continuous integration and simplifies the build process for developers.    
  
***
  
# Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [License](#license)
  
***
  
# Features  
* Custom Windows and Linux images/containers  
* Support for C/C++ projects  
* Integration with CMake, Ninja, VS2019
* Supported compilers; MSVC, GCC, and Clang  
* Optimized for continuous integration and build environments  
* Easily configurable and adaptable to your project's needs  
  
***
  
# Requirements  
* Windows 10 Pro (for running windows containers through docker)  
* Docker Desktop on Windows
* Powershell
* WSL2
  
***
  
# Getting Started  
1. Clone the BuildBuddy repository:  
   `git clone https://github.com/user/BuildBuddy.git`
2. Navigate to the cloned repository:  
   `cd BuildBuddy`  
3. Build the Docker images for Windows and Linux:  
   `.\build-containers.ps1`
  
***
  
# Usage  
1. To use BuildBuddy, simply update your GitHub Actions workflow file to reference your own self-hosted runners. This can be achieved by adding the following; 
   * Windows -    
      `runs-on: Windows`
   * Linux -   
      `runs-on: Ubuntu`
2. Start the Docker containers both Windows and Linux:  
   `.\run-containers.ps1`  
3. Stop both the Docker containers:  
   `.\close-containers.ps1`
  
***
  
# License
BuildBuddy is released under the MIT License.
