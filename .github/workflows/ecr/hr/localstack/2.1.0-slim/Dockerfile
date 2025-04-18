FROM scratch

COPY --from=134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/localstack:2.1.0 / /

LABEL authors="LocalStack Contributors"
LABEL maintainer="LocalStack Team (info@localstack.cloud)"
LABEL description="LocalStack Docker image"

ENV LANG=C.UTF-8
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-11/bin
ENV LANG=C.UTF-8
ENV GPG_KEY=A035C8C19219BA821ECEA86B64E628F8D684696D
ENV PYTHON_VERSION=3.10.11
ENV PYTHON_PIP_VERSION=23.0.1
ENV PYTHON_SETUPTOOLS_VERSION=65.5.1
ENV PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/0d8570dc44796f4369b652222cf176b3db6ac70e/public/get-pip.py
ENV PYTHON_GET_PIP_SHA256=96461deced5c2a487ddc65207ec5a9cffeca0d34e7af7ea1afc470ff0d746207
ENV JAVA_HOME=/usr/lib/jvm/java-11
ENV LD_LIBRARY_PATH=/usr/lib/jvm/java-11/lib:/usr/lib/jvm/java-11/lib/server
ENV USER=localstack
ENV PYTHONUNBUFFERED=1
ENV LOCALSTACK_BUILD_DATE=2023-05-25
ENV LOCALSTACK_BUILD_GIT_HASH=67b55096
ENV LOCALSTACK_BUILD_VERSION=2.1.0

ENV ECR=134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/localstack:2.1.0-slim

SHELL ["/bin/bash", "-c"]

EXPOSE 4510-4559 4566 5678

HEALTHCHECK --interval=10s --start-period=15s --retries=5 --timeout=10s CMD /opt/code/localstack/.venv/bin/localstack status services --format=json

VOLUME /var/lib/localstack

WORKDIR /opt/code/localstack/

ENTRYPOINT ["docker-entrypoint.sh"]
