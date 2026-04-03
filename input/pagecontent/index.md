# ZarishSphere FHIR Implementation Guide

**Version:** 1.0.0 (STU1) | **FHIR Version:** R5 (5.0.0) | **Status:** Active

---

## Introduction

The ZarishSphere FHIR Implementation Guide (IG) defines the FHIR R5 profiles, extensions, value sets, and code systems used by the ZarishSphere platform — a sovereign, free, open-source digital health operating platform for South and Southeast Asia.

This IG is the authoritative source for how ZarishSphere represents clinical data in FHIR R5 format. All `zs-svc-*` clinical services, `zs-core-fhir-engine`, and `zs-ui-*` frontends conform to these profiles.

---

## Scope

This IG covers:

- **Patient registration** — multi-identifier support (UNHCR, national ID, camp registration)
- **Clinical encounters** — outpatient, inpatient, community health worker visits
- **Vital signs** — blood pressure, heart rate, temperature, MUAC, SpO2, weight, height
- **Mental health screening** — PHQ-9, GAD-7
- **Diagnoses** — ICD-11 and SNOMED CT coded conditions
- **Medications** — FHIR R5 MedicationRequest with RxNorm coding
- **Immunizations** — CVX-coded EPI program records
- **Audit trail** — FHIR AuditEvent for HIPAA/GDPR compliance
- **Subscriptions** — FHIR R5 topic-based event notifications
- **Health facilities** — Location resources in the facility registry

---

## Context

ZarishSphere is deployed across humanitarian and national health programs, starting with:
- 🇧🇩 **Bangladesh** — Cox's Bazar Rohingya refugee response, national programs
- 🇲🇲 **Myanmar** — cross-border health programs
- Additional countries: India, Pakistan, Thailand (planned)

The IG incorporates specific requirements for refugee and humanitarian contexts, including UNHCR registration numbers, camp identifiers, and SPHERE humanitarian standards.

---

## Key Profiles

| Profile | Base | Description |
|---------|------|-------------|
| [ZSPatient](StructureDefinition-ZSPatient.html) | Patient | Multi-identifier patient with tenant extension |
| [ZSEncounter](StructureDefinition-ZSEncounter.html) | Encounter | Clinical encounters (OPD, IPD, CHW visits) |
| [ZSObservation](StructureDefinition-ZSObservation.html) | Observation | Base observation with LOINC coding |
| [ZSBloodPressure](StructureDefinition-ZSBloodPressure.html) | ZSObservation | Systolic/diastolic BP with components |
| [ZSMUAC](StructureDefinition-ZSMUAC.html) | ZSObservation | MUAC nutrition screening |
| [ZSPHQ9](StructureDefinition-ZSPHQ9.html) | ZSObservation | PHQ-9 depression screening score |
| [ZSGAD7](StructureDefinition-ZSGAD7.html) | ZSObservation | GAD-7 anxiety screening score |
| [ZSCondition](StructureDefinition-ZSCondition.html) | Condition | ICD-11/SNOMED coded diagnoses |
| [ZSLocation](StructureDefinition-ZSLocation.html) | Location | Health facility registry entries |
| [ZSOrganization](StructureDefinition-ZSOrganization.html) | Organization | NGO/MoH organizations |

---

## Key Extensions

| Extension | Applies to | Description |
|-----------|-----------|-------------|
| [ZSTenantID](StructureDefinition-ZSTenantID.html) | All PHI resources | **Mandatory** — multi-tenancy isolation |
| [ZSCampID](StructureDefinition-ZSCampID.html) | Patient | Refugee/IDP camp identifier |
| [ZSProgramCode](StructureDefinition-ZSProgramCode.html) | Patient, Encounter | Program code (bgd-rohingya, etc.) |
| [ZSDataEntryMode](StructureDefinition-ZSDataEntryMode.html) | All resources | How data was captured (offline, CHW, API) |
| [ZSOfflineSyncID](StructureDefinition-ZSOfflineSyncID.html) | All resources | PowerSync conflict resolution ID |

---

## Governance

This IG is governed by `zs-docs-standards` via the RFC process.
Changes require RFC → ADR → PR with 2 owner approvals.

See [CONTRIBUTING.md](https://github.com/zarishsphere/.github/blob/main/CONTRIBUTING.md) for contribution guidelines.

---

*ZarishSphere · Free forever · Apache 2.0 · [zarishsphere.com](https://zarishsphere.com)*
