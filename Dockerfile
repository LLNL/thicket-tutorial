FROM jupyter/base-notebook:python-3.7.6

USER root
RUN apt-get update && apt-get install -y gcc

COPY . $HOME/thicket-tutorial/

WORKDIR $HOME/thicket-tutorial/

RUN pip install -r requirements.txt

CMD ["/usr/local/bin/start-notebook.sh"]
