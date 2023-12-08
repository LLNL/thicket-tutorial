FROM continuumio/miniconda3:4.12.0

USER root

ENV NB_USER=jovyan \
    NB_UID=1000 \
    HOME=/home/jovyan

RUN adduser \
    --disabled-password \
    --gecos "Default User" \
    --uid ${NB_UID} \
    --home ${HOME} \
    --force-badname \
    ${NB_USER}

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y -c conda-forge \
    jupyter \
    jupyterlab \
    ipython

COPY ./requirements.txt ./requirements.txt

RUN python3 -m pip install -r requirements.txt \
    && python3 -m pip install papermill

RUN chown -R ${NB_USER} "${HOME}"

USER ${NB_USER}
WORKDIR ${HOME}
ENV PATH="${HOME}/.local/bin:${PATH}"

COPY --chown=${NB_USER} ./notebooks/01_thicket_tutorial.ipynb ./notebooks/01_thicket_tutorial.ipynb
COPY --chown=${NB_USER} ./notebooks/02_thicket_rajaperf_clustering.ipynb ./notebooks/02_thicket_rajaperf_clustering.ipynb
COPY --chown=${NB_USER} ./notebooks/03_extrap-with-metadata-aggregated.ipynb ./notebooks/03_extrap-with-metadata-aggregated.ipynb
COPY --chown=${NB_USER} ./notebooks/04_stats-functions.ipynb ./notebooks/04_stats-functions.ipynb
COPY --chown=${NB_USER} ./data/ ./data/

COPY ./docker_scripts/entrypoint.sh /entrypoint.sh
COPY ./docker_scripts/start.sh /start.sh
COPY ./docker_scripts/run_all.sh /run_all.sh

ENV SHELL=/usr/bin/bash
EXPOSE 8888
ENTRYPOINT [ "tini", "--" ]

CMD [ "jupyter", "notebook" ]
