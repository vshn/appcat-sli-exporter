# AppCat SLI Exporter

[![Build](https://img.shields.io/github/workflow/status/vshn/appcat-sli-exporter/Test)][build]
![Go version](https://img.shields.io/github/go-mod/go-version/vshn/appcat-sli-exporter)
[![Version](https://img.shields.io/github/v/release/vshn/appcat-sli-exporter)][releases]
[![GitHub downloads](https://img.shields.io/github/downloads/vshn/appcat-sli-exporter/total)][releases]

[build]: https://github.com/vshn/appcat-sli-exporter/actions?query=workflow%3ATest
[releases]: https://github.com/vshn/appcat-sli-exporter/releases

:warning: This repository and its content has been moved to [appcat](https://github.com/vshn/appcat)

The ApppCat SLI Exporter is a Prometheus that automatically detects AppCat services and measures uptime SLIs.

## Building

See `make help` for a list of build targets.

* `make build`: Build binary for linux/amd64
* `make build -e GOOS=darwin -e GOARCH=arm64`: Build binary for macos/arm64
* `make docker-build`: Build Docker image for local environment

## Metrics

The exporter exposes a histogram `appcat_probes_seconds` with four labels

 * `service`, the service type that was probed (e.g. `VSHNPostgreSQL`)
 * `namespace`, the namespace of the claim that was monitored
 * `name`, the name of the claim that was monitored
 * `reason`, if the probe was successful. Can either be `success`, `fail-timeout`, or `fail-unkown`

## Architecture

```
.
├── config // Kustomize files to deploy the exporter
├── controllers
│   └── vshnpostgresql_controller.go // starts probes for VSHNPostgreSQL claims
├── Dockerfile
├── main.go
├── probes
│   ├── manager.go // manages all started probes and exposes metrics
│   └── postgresql.go // prober implementation for postgresql
├── README.md
└── tools.go
```

### Adding a Prober

To add a prober for a new service, add a file in `probes/` that adds another implementation of the `Prober` interface.

### Adding an AppCat service

There should be a separate controller per AppCat Claim type.
Add another controller for each service that should be probed.

### Adding SLA exceptions

If possible SLA exceptions should be implemented as a middleware for the `Prober` interface.
