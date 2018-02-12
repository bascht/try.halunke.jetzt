# try.halunke.jetzt

Small Rails app that launches the Halunke web REPL.

You can build + run the app locally via Docker:

```
docker build -t try.halunke.jetzt:latest .
```

## Deployment

The App is deployed to Dokku – if there's no git remote remote set yet, add one via:

```
git remote add dokku dokku@try.halunke.jetzt:try.halunke.jetzt
```

Then deploy the current master branch via:

```
git push dokku master
```

## Updating the built-in Halunke version

The Halunke version is set via the environment variable `HALUNKE_IMAGE` in the `Dockerfile`. Update it to match the release version found at the [Docker Hub page](https://hub.docker.com/r/moonglum/halunke/builds/).
