// ZarishSphere Patient Profile (ZSPatient)
// FHIR Shorthand (FSH) definition for the ZarishSphere Patient profile.
// Compiled with SUSHI to generate StructureDefinition JSON.
//
// This profile applies to all patient registrations across ZarishSphere programs.
// It mandates multi-identifier support (UNHCR, national ID, camp ID) and
// the tenant-id extension required for multi-tenancy.
//
// Governance: zs-docs-standards, RFC-0001
// Used by: zs-svc-patient, zs-ui-patient-registration, zs-mobile-clinic

Profile: ZSPatient
Parent: Patient
Id: ZSPatient
Title: "ZarishSphere Patient"
Description: """
  Base patient profile for all ZarishSphere programs. Mandates:
  - At least one identifier (UNHCR, national ID, or ZarishSphere internal ID)
  - Tenant-id extension for multi-tenancy isolation
  - Active status tracking
  - At least one name element
  - Language capability (for multilingual clinical forms)
"""

// ZarishSphere-specific extensions
* extension contains
    ZSTenantID named tenantId 1..1 MS and
    ZSCampID named campId 0..1 MS and
    ZSProgramCode named programCode 0..1 MS

// Identifier: at least one required
// Supports: UNHCR ID, national ID, ZarishSphere internal ID, camp registration number
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Patient identifiers (UNHCR, national ID, camp ID, or ZS internal)"

* identifier contains
    unhcrId 0..1 MS and
    nationalId 0..1 MS and
    zsId 0..1 MS and
    campId 0..1 MS

* identifier[unhcrId].system = "https://fhir.zarishsphere.com/NamingSystem/unhcr-id" (exactly)
* identifier[unhcrId].use = #official
* identifier[unhcrId] ^short = "UNHCR registration ID (refugee populations)"

* identifier[nationalId].system = "https://fhir.zarishsphere.com/NamingSystem/national-id" (exactly)
* identifier[nationalId].use = #official
* identifier[nationalId] ^short = "National identity document number"

* identifier[zsId].system = "https://fhir.zarishsphere.com/NamingSystem/patient-id" (exactly)
* identifier[zsId] ^short = "ZarishSphere internal patient ID (auto-generated)"

* identifier[campId].system = "https://fhir.zarishsphere.com/NamingSystem/camp-id" (exactly)
* identifier[campId] ^short = "Humanitarian camp registration number (Cox's Bazar etc.)"

// Name: at least one required
* name 1..* MS
* name.use MS
* name.family MS
* name.given MS

// Gender: required
* gender 1..1 MS

// Birth date: required (for age calculation, EPI, etc.)
* birthDate 1..1 MS

// Active: required
* active 1..1 MS

// Communication: language support for multilingual forms
* communication MS
* communication.language MS
* communication.language ^short = "Patient's preferred language (en, bn, my, ur, hi, th)"

// Contact: for community health worker programs
* contact MS

// Address: for facility assignment and geo-mapping
* address MS
* address.country MS
* address.district MS

// Link: for MPI (Master Patient Index) duplicate linking
* link MS

// Deceased: for mortality tracking
* deceased[x] MS
