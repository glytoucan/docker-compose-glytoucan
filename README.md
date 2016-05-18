# welcome to glytoucan

## Submodules
This is the main glytoucan environment repository.

The best way to clone this repository is with the following parameter in the clone command:
git clone --recursive https://github.com/glytoucan/docker-compose-glytoucan.git 

This is because of the submodules to each of the different subsystems within glytoucan.

Please refer to the [submodule manual](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for a better explanation.

if you did not do recursive, and need a submodule, cd into the folder and then run:
git submodule init
git submodule update

to clone the code.

## Environment Variables

There are a few variables that this compose file relies upon to have a running system:

1. WORKSPACE = workspace folder name which contains all of the source code
1. WORKSPACE_PARENT = folder of the parent of the workspace

