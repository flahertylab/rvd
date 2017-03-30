FROM ubuntu:trusty
MAINTAINER Patrick Flaherty <flaherty@math.umass.edu>

# Install python, libhdf5
RUN apt-get update && apt-get install -y \
    gcc \
    python-pip \
    python-dev \
    python-numpy \
    python-scipy \
    cython \
    libhdf5-dev \
&& rm -rf /var/lib/apt/lists/*

# Load python packages
RUN pip install h5py logging multiprocessing
#RUN conda install numpy scipy h5py argparse

RUN mkdir -p /src
COPY requirements.txt /src
COPY rvd27.py /src

#RUN pip install -r /src/requirements.txt
#RUN conda install --yes --file /src/requirements.txt

VOLUME /work
WORKDIR /work

ENTRYPOINT ["python", "/src/rvd27.py"]
