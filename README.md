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

## Example
An incomplete example and a way to structure your CI pipeline is in `example/`. The important files to consider are the main `pipeline.yml` and its corresponding tasks, each of which have the files `task.yml` and `run.sh`.

To setup or update your pipeline, make sure to update the master branch and also run:
```bash
fly -t <target> sp -p <pipeline-name> -c example/pipeline.yml -l <secrets-file>
```

**The `<pipeline-name>` can be anything, and the `<secrets-file>` are variables you want to load into the `pipeline.yml`. For example, both `MINIO_ACCESS_KEY_ID` and `MINIO_SECRET_ACCESS_KEY` are needed.*
