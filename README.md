# C_whale 🐳
C based language for Dockerfile management, image and container deployment.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Design Choices](#design-choices)
- [ORCA](#orca)
- [BELUGA](#beluga)
- [DOLPHIN](#dolphin)
- [BLUEWHALE](#bluewhale)


## Overview

**Docker**, a containerization platform, streamlines application deployment and consistency. Leveraging a C-based language for Docker simplifies container creation, making it efficient and resource-optimized, enhancing the process of spinning up containers and building images

**C_Whale** is a Domain Specific Language that facilitates the process of creating docker images and seamlessly spinning up containers without having to go through memorizing complex docker commands.

## Running C_Whale

### **Prerequisites**

>- Docker
>- Git

To run C_Whale, you must have **Docker** installed on your machine. To install Docker, please refer to the [official documentation](https://docs.docker.com/get-docker/).

Once you have Docker installed, you can run the following commands to build and run C_Whale:

```bash
git clone https://github.com/rorosaga/C_whale.git
```
**NOTE**: `.cw` files are the C_Whale files that contain the C_Whale code.

### **Mac/Linux**
***
```bash
./c_whale < file_name.cw
```

**file_name.cw** is the name of the file containing the C_Whale code.

Alternatively, you can run:

```bash
./c_whale
```
And then enter the C_Whale code in the terminal.

### **Windows**
***
In Windows CMD, run the following command:
```bash
c_whale.exe < file_name.cw
```
**file_name.cw** is the name of the file containing the C_Whale code.

Alternatively, you can run:

```bash
c_whale.exe
```
And then enter the C_Whale code in the terminal.

## Design Choices

C_Whale is designed to streamline Dockerfile management, image creation, and container deployment using a C-based language. The following design choices have been made to enhance usability, efficiency, and maintainability:

### **1. C-Based Syntax**

The decision to use a C-based syntax aims to leverage the familiarity of the C language, making it accessible to a broad audience of developers. This choice allows users to define Dockerfile instructions in a manner that closely resembles traditional C programming.

### **2. Modular Structure**

C_Whale adopts a modular structure with distinct components for image creation (`orca`), container management (`beluga`), information retrieval (`dolphin`), and system cleanup (`bluewhale`). This separation facilitates a clear and organized syntax for each set of functionalities.

### **3. Intuitive Command Naming**

Commands in C_Whale are named after marine animals (ORCA, BELUGA, DOLPHIN, BLUEWHALE) to provide an intuitive and memorable way to associate each set of commands with its specific functionality. This naming convention aims to enhance user experience and ease of understanding.

### **4. Action-Subcommand Pattern**

The language adopts an action-subcommand pattern for each command, promoting a clear and concise syntax. Users can specify actions (e.g., `create` or `prune_images`) followed by subcommands (e.g., `from`, `commands`, `image_name`). This pattern is designed to enhance readability and expressiveness.

### **5. Examples for Clarity**

To facilitate user understanding, the documentation includes comprehensive examples demonstrating the usage of each command. These examples showcase common scenarios, providing users with practical insights into how to effectively utilize C_Whale for Docker-related tasks.

## ORCA

`orca` commands serve in the creation and management of Dockerfiles.

### **ORCA Commands Structure**

The basic structure of an `orca` command is as follows:

```c
orca {
    orca_action {
        orca_subcommand -> "string_literal";
    }
};
```

| Literal | Usage |
| --- | --- |
| orca | Indicates the beginning of an ORCA command |
| orca_action | Indicates the action to be performed |
| orca_subcommand | Indicates the subcommand to be performed |

### **orca_action**

| Action | Usage |
| --- | --- |
| create | create a Dockerfile |


### **orca_subcommand**

| Subcommand | Usage |
| --- | --- |
| from | set the base image |
| commands | set the commands to be run |
| image_name | set the name of the image |


## Examples

### **Create a Dockerfile**

```c
orca {
    create {
        from -> "ubuntu";
        ...
    }
};
```


## BELUGA 

C_Whale introduces the `beluga` commands to streamline the creation and management of Docker containers.

### **BELUGA Commands Structure**

The basic structure of a `beluga` command is as follows:

```c
beluga {
    beluga_action {
        beluga_subcommand -> "string_literal";
    }
};
```

### **beluga_action**

| Action | Usage |
| --- | --- |


### **beluga_subcommand**

| Subcommand | Usage |
| --- | --- |


## DOLPHIN

`dolphin` commands help retrieve information about Docker images and containers as well as removing them.

### **DOLPHIN Commands Structure**

The basic structure of a `dolphin` command is as follows:

```c
dolphin {
    dolphin_action;
};
```

| Literal | Usage |
| --- | --- |
| dolphin | Indicates the beginning of a DOLPHIN command |
| dolphin_action | Indicates the action to be performed |

### **dolphin_action**

| Action | Usage |
| --- | --- |
| list_images | list all Docker images and containers |
| list_containers | list all Docker containers |
| remove_images | remove a Docker image |
| remove_containers | remove a Docker container |
| system_info | display system-wide information |

## Example

### **List all Docker images**

```c
dolphin {
    list_images;
};
```

### **List all Docker containers**

```c
dolphin {
    list_containers;
};
```


## BLUEWHALE

`bluewhale` commands help with removing unused images and containers (prune operations)

### **BLUEWHALE Commands Structure**

The basic structure of a `bluewhale` command is as follows:

```c
bluewhale {
    bluewhale_action;
};
```

| Literal | Usage |
| --- | --- |
| bluewhale | Indicates the beginning of a BLUEWHALE command |
| bluewhale_action | Indicates the action to be performed |

### **bluewhale_action**

| Action | Usage |
| --- | --- |
| prune_images | remove unused Docker images |
| prune_containers | remove unused Docker containers |
| prune_networks | remove unused Docker networks |
| prune_volumes | remove unused Docker volumes |
| prune_system | remove unused Docker images, containers, networks, and volumes |

## Example

### **Remove unused Docker images**

```c
bluewhale {
    prune_images;
};
```

### **Remove unused Docker containers**

```c
bluewhale {
    prune_containers;
};
```
