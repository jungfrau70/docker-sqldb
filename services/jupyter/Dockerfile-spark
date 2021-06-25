FROM jupyter/all-spark-notebook
#FROM jupyter/scipy-notebook

USER root

RUN python -m pip install --upgrade pip

RUN pip install --proxy=${http_proxy}\
    psycopg2-binary\
    minio\
    tensorflow\
    pyngrok\
    streamlit\
    Flask\
    implicit\
    gensim\
    beautifulsoup4\
    lxml\
    requests\
    selenium\
    JPype1\
    konlpy\
    soynlp\
    wordcloud\
    ipython-sql

RUN python -m pip install --upgrade --no-deps --force-reinstall notebook
#
RUN python -m pip install jupyterthemes
RUN python -m pip install --upgrade jupyterthemes
RUN python -m pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
# enable the Nbextensions
RUN jupyter nbextension enable contrib_nbextensions_help_item/main
RUN jupyter nbextension enable autosavetime/main
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable code_font_size/code_font_size
RUN jupyter nbextension enable code_prettify/code_prettify
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable comment-uncomment/main
RUN jupyter nbextension enable equation-numbering/main
RUN jupyter nbextension enable execute_time/ExecuteTime 
RUN jupyter nbextension enable gist_it/main 
RUN jupyter nbextension enable hide_input/main 
RUN jupyter nbextension enable spellchecker/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable toggle_all_line_numbers/main

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt -f install
RUN apt-get -y install libappindicator3-1
RUN apt-get -y install libxss1 libgbm1 libxtst6 xvfb screen

# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# RUN dpkg -i google-chrome-stable_current_amd64.deb
# RUN apt-get install -y

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN apt-get update --fix-missing
RUN dpkg --configure -a
RUN apt-get -fy install

# ## For chromedriver installation: curl/wget/libgconf/unzip
# RUN apt-get update -y && apt-get install -y wget curl unzip libgconf-2-4
# ## For project usage: python3/python3-pip/chromium/xvfb
# RUN apt-get update -y && apt-get install -y chromium xvfb python3 python3-pip 


# Download, unzip, and install chromedriver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/


# Create directory for project name (ensure it does not conflict with default debian /opt/ directories).
RUN mkdir -p /opt/app
WORKDIR /opt/app



## Copy over project/script (feel free to combine these if your project is a combination of both directories and top-level files)
### For projects which are modules
#COPY app/ .
## For projects which are single scripts
COPY test.py .
COPY dic_user.txt /opt/conda/lib/python3.8/site-packages/konlpy/java/data/kE/

RUN conda install -y psycopg2

# Set display port and dbus env to avoid hanging
ENV DISPLAY=:99
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# Bash script to invoke xvfb, any preliminary commands, then invoke project
COPY run.sh .
CMD /bin/bash run.sh

WORKDIR /home/jovyan

USER jovyan