# Simple Dart API

### Intro

This is an example of a simple API written in Dart using the Angel Frameworks.

### Build & Run

How to run
```
$ dart bin/main.dart
```

Listening on
```
http://localhost:3000
```

### Docker

To build a docker image tagged with `dart/app` run:
```
docker build -t dart/app .
```

To run this image in a container:
```
docker run -i -t dart/app
```

To run this image in a container listening on port `3000`:
```
docker run -d -p 3000:3000 -t dart/app
```