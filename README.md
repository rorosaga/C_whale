# C_whale 🐳
C based language for Dockerfile management, image and container deployment.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [ORCA](#orca)
- [BELUGA](#beluga)
- [DOLPHIN](#dolphin)
- [BLUEWHALE](#bluewhale)

## Overview

Docker, a containerization platform, streamlines application deployment and consistency. Leveraging a C-based language for Docker simplifies container creation, making it efficient and resource-optimized, enhancing the process of spinning up containers and building images

C_Whale is a Domain Specific Language that facilitates the process of creating docker images and seamlessly spinning up containers without having to go through memorizing complex docker commands.

## Installation

To use C_Whale and leverage the ORCA commands, follow these installation steps:

1. Clone the C_Whale repository from [GitHub](https://github.com/C_Whale).
2. Build the C_Whale compiler using the provided build script.
3. Ensure that the C_Whale binary is in your system's PATH.

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
| remove | remove a Dockerfile |
| list | list all Dockerfiles |

### **orca_subcommand**

| Subcommand | Usage |
| --- | --- |
| base | base image to use for the Dockerfile |
| run | command to run in the container |
| expose | port to expose |
| env | environment variable to set |
| copy | file to copy |


## Examples

### **Create a Dockerfile**

```c
orca {
    create {
        base -> "ubuntu";
        run -> "apt-get update";
        run -> "apt-get install -y python3";
        run -> "apt-get install -y python3-pip";
        run -> "pip3 install flask";
        expose -> "5000";
        env -> "FLASK_APP=app.py";
        copy -> "app.py";
    }
};
```


## BELUGA 

C_Whale introduces the `beluga` commands to streamline the creation and management of Docker containers.

### **BELUGA Commands Structure**

The basic structure of a `beluga` command is as follows:

```c
beluga {
    beluga_action
};
```

### **beluga_action**


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
