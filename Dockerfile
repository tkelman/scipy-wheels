FROM quay.io/pypa/manylinux1_x86_64
RUN yum install -y zip
RUN git clone --recursive -b v1.0.0-stripped-before-auditwheel \
        https://github.com/tkelman/scipy-wheels /io

ENV BUILD_COMMANDS "clean_code scipy"
ENV BUILD_COMMIT 11509c4a98edded6c59423ac44ca1b7f28fba1fd
RUN bash -x /io/multibuild/docker_build_wrap.sh

ENV BUILD_COMMANDS "build_wheel scipy"
ENV PLAT x86_64
ENV PYTHON_VERSION 3.6
ENV BUILD_DEPENDS "numpy==1.11.3 Cython==0.26.1"
RUN bash -x /io/multibuild/docker_build_wrap.sh
