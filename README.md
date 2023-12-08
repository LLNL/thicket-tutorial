[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/llnl/thicket-tutorial/develop)


# <img src="https://raw.githubusercontent.com/llnl/thicket/develop/logo-notext.png" width="64" valign="middle" alt="thicket"/> Thicket Tutorial


Thicket is a python-based toolkit for Exploratory Data Analysis (EDA) of
parallel performance data that enables performance optimization and
understanding of applications' performance on supercomputers. It bridges the
performance tool gap between being able to consider only a single instance of a
simulation run (e.g., single platform, single measurement tool, or single
scale) and finding actionable insights in multi-dimensional, multi-scale,
multi-architecture, and multi-tool performance datasets.

You can find detailed documentation, along with non-interactive tutorials from this repository of Thicket in the
[ReadTheDocs](https://thicket.readthedocs.io/en/latest/).

This repository contains materials for Thicket's hands-on tutorial. You can do
all of the exercises on your own laptop using BinderHub.

You find Thicket itself in its Github repository: https://github.com/llnl/thicket

### Running the notebooks online

We use [BinderHub](https://mybinder.org) to create a shareable and interactive
environment of the notebooks within a live JupyterHub instance.

You can access the interactive environment at this
[link](https://mybinder.org/v2/gh/llnl/thicket-tutorial/develop)
or by clicking the badge at the top of this file.

### Running the notebooks locally

We provide a Dockerfile for users to run the notebooks locally. To run locally, you must first build the Docker container with:

```bash
$ docker build -t thicket-tutorial -f local_run/Dockerfile.spawn .
```

Then, you must create a Docker network with:

```bash
$ docker network create jupyterhub
```

Finally, you can launch the tutorial. To launch the tutorial without preserving any changes, run:

```bash
$ docker run --rm -it --entrypoint /start.sh -v /var/run/docker.sock:/var/run/docker.sock --net jupyterhub --name jupyterhub -p 8888:8888 thicket-tutorial
```

If you would rather your changes be preserved, run:

```bash
$ docker run --rm -it --entrypoint /start.sh -v /var/run/docker.sock:/var/run/docker.sock -v .:/home/jovyan --net jupyterhub --name jupyterhub -p 8888:8888 thicket-tutorial
```

The Docker-based code for running this tutorial locally was derived from the material from the 2023 RADIUSS tutorial for Flux, which can be found here: https://github.com/flux-framework/Tutorials/tree/master/2023-RADIUSS-AWS/JupyterNotebook

### License

This repository is distributed under the terms of the MIT license.

All contributions must be made under the MIT license.  Copyrights are retained
by contributors. No copyright assignment is required to contribute to this
project.

See [LICENSE](https://github.com/llnl/thicket-tutorial/blob/develop/LICENSE).

SPDX-License-Identifier: MIT

LLNL-CODE-834749
