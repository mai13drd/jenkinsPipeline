#!/bin/bash

set -e

cd ../common

git clone https://github.com/dagere/peass && \
    cd peass && \
    git reset --hard d477c0fc && \
    mvn clean install -pl dependency,measurement,analysis -DskipTests

cd ..

git clone https://github.com/dagere/peass-ci && \
    cd peass-ci && \
    git reset --hard 3f521d9 && \
    ./mvnw clean -B package --file pom.xml -DskipTests

