
![Logo](portal-logo.png)

# PhenoMeNal App Library Backend
Version: 1.4

## Short Description

Backend service for the PhenoMeNal App Library

## Description

The PhenoMeNal Cloud Research Environment (CRE) portal provides an entry point to analysis tools via its open source “App Library” (Application Library) – a service catalogue of all applications (currently 24) that are currently available via Galaxy workflows through the CRE.  Each tool, available in the form of Docker container,  carries a tool description, usage instructions to be able to use the tool in isolation locally through its docker container, and links to its publications and version control repository. The App Library retrieves tool metadata from the associated README files in the GitHub Repositories. The user can browse, search or filter these tools by functionality (e.g annotation, statistical analysis or pre-/post-processing), approach or technique (e.g metabolomics, lipidomics, glycomics or isotopic labelling analysis) or instrument data types (e.g MS or NMR).


## Key features

- Local Cloud Research Environment Deployment
- App Library

## Functionality

- Other Tools


## Tool Authors

- Sijin He (EMBL-EBI)
- Pablo Moreno (EMBL-EBI)
- Marco Enrico Piras (CRS4)

## Container Contributors

- [Sijin He](https://github.com/sh107) (EMBL-EBI)
- [Pablo Moreno](https://github.com/pcm32) (EMBL-EBI)
- [Marco Enrico Piras](https://github.com/kikkomep) (CRS4)

## Website

- http://portal.phenomenal-h2020.eu/


## Git Repository

- https://github.com/phnmnl/container-phenomenal-portal-app-library.git

## Installation 

For local individual installation:

```bash
docker pull container-registry.phenomenal-h2020.eu/phnmnl/phenomenal-portal-app-library
```

## Usage Instructions

For direct docker usage:

```bash
docker run -d -p 3001:80 -it container-registry.phenomenal-h2020.eu/phnmnl/phenomenal-portal-app-library /bin/bash -c "./bin/run.sh && /my_init"
```
