// ZarishSphere FHIR R5 Extensions
// All ZarishSphere-specific FHIR extensions are defined here.

// ----------------------------------------------------------------------------
// Tenant ID Extension
// Required on all PHI resources for multi-tenancy isolation.
// Format: {org_code}:{program_code}:{site_code}
// Example: cpi:bgd-health:camp-1w
// ----------------------------------------------------------------------------

Extension: ZSTenantID
Id: ZSTenantID
Title: "ZarishSphere Tenant ID"
Description: """
  Identifies the tenant (organization:program:site) that owns this resource.
  This extension is MANDATORY on all PHI resources.
  The tenant_id is used for PostgreSQL Row-Level Security enforcement.
  Format: {org_code}:{program_code}:{site_code}
  Example: cpi:bgd-health:camp-1w
"""
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* ^context[+].type = #element
* ^context[=].expression = "Observation"
* ^context[+].type = #element
* ^context[=].expression = "Condition"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "Immunization"
* ^context[+].type = #element
* ^context[=].expression = "AuditEvent"
* ^context[+].type = #element
* ^context[=].expression = "Subscription"
* value[x] only string
* valueString 1..1
* valueString ^short = "Tenant ID in format org:program:site"
* valueString obeys zs-tenant-format

Invariant: zs-tenant-format
Description: "Tenant ID must follow the format org:program:site (colon-separated)"
Expression: "value.matches('^[a-z0-9-]+:[a-z0-9-]+:[a-z0-9-]+$')"
Severity: #warning

// ----------------------------------------------------------------------------
// Camp ID Extension
// For humanitarian programs (Cox's Bazar, etc.)
// ----------------------------------------------------------------------------

Extension: ZSCampID
Id: ZSCampID
Title: "ZarishSphere Camp ID"
Description: "Humanitarian camp identifier for refugee/IDP programs. Required for BGD-CXB distro."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only string
* valueString 1..1
* valueString ^short = "Camp identifier (e.g., camp-1w, camp-4)"

// ----------------------------------------------------------------------------
// Program Code Extension
// Identifies which ZarishSphere program this resource belongs to
// ----------------------------------------------------------------------------

Extension: ZSProgramCode
Id: ZSProgramCode
Title: "ZarishSphere Program Code"
Description: "The health program this resource belongs to (e.g., bgd-health, bgd-rohingya-response, mmr-border-health)."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only code
* valueCode 1..1
* valueCode from ZSProgramCodeValueSet (extensible)

// ----------------------------------------------------------------------------
// Data Entry Mode Extension
// Tracks how data was entered (offline, online, imported, CHW)
// ----------------------------------------------------------------------------

Extension: ZSDataEntryMode
Id: ZSDataEntryMode
Title: "ZarishSphere Data Entry Mode"
Description: "How the data was captured — important for data quality tracking."
* ^context[+].type = #element
* ^context[=].expression = "Resource"
* value[x] only code
* valueCode 1..1
* valueCode from ZSDataEntryModeValueSet (required)

// ----------------------------------------------------------------------------
// Offline Sync ID Extension
// Used by the offline sync engine (PowerSync) to track sync state
// ----------------------------------------------------------------------------

Extension: ZSOfflineSyncID
Id: ZSOfflineSyncID
Title: "ZarishSphere Offline Sync ID"
Description: "Unique identifier assigned by the offline sync engine. Used to detect and resolve conflicts during synchronisation."
* ^context[+].type = #element
* ^context[=].expression = "Resource"
* value[x] only string
* valueString 1..1

// ----------------------------------------------------------------------------
// UNHCR Registration Number Extension
// Specific to refugee response programs
// ----------------------------------------------------------------------------

Extension: ZSUNHCRRegistration
Id: ZSUNHCRRegistration
Title: "UNHCR Registration Number"
Description: "UNHCR individual refugee registration number. Used in Cox's Bazar and other refugee response programs."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only string
* valueString 1..1
