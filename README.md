# CI
> Self-hosted with Docker Registry and Minio Server

## Setup
```bash
setup.sh
```

## Run
```bash
docker-compose up -d
```

## Pipeline
1. Install the `fly` CLI by going to `localhost:8080` and clicking the download link for your platform.
2. Create a new target for your CI.
```bash
fly -t <target> login -c http://localhost:8080
```
3. Create your project's pipeline by following the [docs](https://concourse.ci/pipelines.html).
