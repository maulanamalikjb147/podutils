FROM --platform=linux/amd64 alpine:latest

MAINTAINER Viki Pranata <helovikipranata@gmail.com>

WORKDIR /temp

RUN apk update

# Install necessary tools for amd64 architecture
RUN apk add --no-cache busybox-extras traceroute curl bind-tools net-tools whois fio iperf3 hdparm

# Install PostgreSQL client and Redis CLI (amd64)
RUN apk add --no-cache postgresql-client redis

# Optional: Verify the installation of psql and redis-cli
RUN psql --version && redis-cli --version

COPY Dockerfile /Dockerfile

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/maulanamalikjb147/podutils.git"
