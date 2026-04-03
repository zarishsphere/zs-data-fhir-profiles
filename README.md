# zs-data-fhir-profiles

> **ZarishSphere Platform** · [github.com/orgs/zarishsphere](https://github.com/orgs/zarishsphere)

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](../../LICENSE)
[![Go](https://img.shields.io/badge/Go-1.26.1-00ADD8?logo=go)](https://golang.org)
[![FHIR R5](https://img.shields.io/badge/FHIR-R5%205.0.0-orange)](https://hl7.org/fhir/R5/)
[![CI](https://github.com/zarishsphere/zs-data-fhir-profiles/actions/workflows/ci.yml/badge.svg)](https://github.com/zarishsphere/zs-data-fhir-profiles/actions)

ZarishSphere FHIR R5 Implementation Guide (IG). Defines FHIR profiles (ZSPatient, ZSObservation, ZSEncounter...), extensions (tenant-id, camp-id, program-code), value sets, and code systems using FHIR Shorthand (FSH).

---

## Quick start

```bash
# Run locally (requires Go 1.26.1)
make dev

# Run tests
make test

# Build binary
make build

# Build multi-arch Docker image (amd64 + arm64 / Raspberry Pi 5)
make docker-build
```
---

**Part of ZarishSphere** · Apache 2.0 · Free forever · [platform@zarishsphere.com](mailto:platform@zarishsphere.com)
