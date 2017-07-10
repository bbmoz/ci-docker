# CI
> Self-hosted with Docker Registry and Minio Server

## Setup
```bash
setup.sh
```

**You will get a warning about missing environment variables. It may be a good idea to have a `.env` file that contains these variables which you can source.*

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
A simple example and a way to structure your CI pipeline is in `example/`. The important files to consider are the main `pipeline.yml` and its corresponding tasks, each of which have the files `task.yml` and `run.sh`.

To update your pipeline, make sure to push to the master branch if you made any task file changes and run:
```bash
fly -t <target> sp -p <pipeline-name> -c example/pipeline.yml -l <vars-yml>
```

**The `<pipeline-name>` can be anything, and the `<vars-yml>` are variables you want to load into the `pipeline.yml`. For example, both `MINIO_ACCESS_KEY` and `MINIO_SECRET_KEY` are needed for the example pipeline.*
