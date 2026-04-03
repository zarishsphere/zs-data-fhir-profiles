// ZarishSphere Observation Profiles
// FHIR Shorthand for clinical observation profiles.
// Covers: vital signs, MUAC, lab results, PHQ-9, GAD-7

// ----------------------------------------------------------------------------
// Base Observation Profile
// ----------------------------------------------------------------------------

Profile: ZSObservation
Parent: Observation
Id: ZSObservation
Title: "ZarishSphere Observation"
Description: "Base profile for all ZarishSphere clinical observations. Mandates LOINC coding, tenant extension, and audit trail."

* extension contains ZSTenantID named tenantId 1..1 MS
* status 1..1 MS
* code 1..1 MS
* code.coding 1..* MS
* code.coding.system 1..1 MS
* code.coding.code 1..1 MS
* subject 1..1 MS
* subject only Reference(ZSPatient)
* effective[x] 1..1 MS
* issued 0..1 MS

// ----------------------------------------------------------------------------
// Vital Signs Panel
// ----------------------------------------------------------------------------

Profile: ZSVitalSignsObservation
Parent: ZSObservation
Id: ZSVitalSignsObservation
Title: "ZarishSphere Vital Signs"
Description: "Profile for vital signs observations (BP, HR, Temp, RR, SpO2, weight, height). Uses LOINC codes and UCUM units."

* category 1..* MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code from ZSVitalSignsValueSet (extensible)

// ----------------------------------------------------------------------------
// Blood Pressure Profile
// ----------------------------------------------------------------------------

Profile: ZSBloodPressure
Parent: ZSVitalSignsObservation
Id: ZSBloodPressure
Title: "ZarishSphere Blood Pressure"
Description: """
  FHIR R5 profile for blood pressure observations.
  Uses LOINC panel code 55284-4 with systolic (8480-6) and diastolic (8462-4) components.
  UCUM unit: mm[Hg].
"""

* code = http://loinc.org#55284-4 "Blood pressure systolic and diastolic"
* value[x] 0..0  // BP is always in components
* component 2..2 MS

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed

* component contains
    systolic 1..1 MS and
    diastolic 1..1 MS

* component[systolic].code = http://loinc.org#8480-6 "Systolic blood pressure" (exactly)
* component[systolic].value[x] only Quantity
* component[systolic].valueQuantity.unit = "mmHg"
* component[systolic].valueQuantity.system = "http://unitsofmeasure.org"
* component[systolic].valueQuantity.code = #mm[Hg]
* component[systolic].valueQuantity.value 1..1 MS

* component[diastolic].code = http://loinc.org#8462-4 "Diastolic blood pressure" (exactly)
* component[diastolic].value[x] only Quantity
* component[diastolic].valueQuantity.unit = "mmHg"
* component[diastolic].valueQuantity.system = "http://unitsofmeasure.org"
* component[diastolic].valueQuantity.code = #mm[Hg]
* component[diastolic].valueQuantity.value 1..1 MS

// ----------------------------------------------------------------------------
// MUAC (Mid-Upper Arm Circumference) Profile
// Critical for nutrition screening in ZarishSphere programs
// ----------------------------------------------------------------------------

Profile: ZSMUAC
Parent: ZSObservation
Id: ZSMUAC
Title: "ZarishSphere MUAC"
Description: """
  MUAC (Mid-Upper Arm Circumference) observation for nutrition screening.
  Used in CMAM (Community-based Management of Acute Malnutrition) programs.
  LOINC code: 56072-2. UCUM unit: cm.
  Cut-off interpretation:
    < 11.5 cm  → Severe Acute Malnutrition (SAM)
    11.5–12.4 cm → Moderate Acute Malnutrition (MAM)
    ≥ 12.5 cm  → Normal
"""

* code = http://loinc.org#56072-2 "Mid upper arm circumference"
* category contains nutritionCategory 1..1
* category[nutritionCategory] = http://terminology.hl7.org/CodeSystem/observation-category#survey "Survey"
* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity.unit = "cm"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #cm
* valueQuantity.value 1..1 MS
* referenceRange 0..* MS  // For SAM/MAM cut-off ranges

// ----------------------------------------------------------------------------
// PHQ-9 (Depression Screening)
// ----------------------------------------------------------------------------

Profile: ZSPHQ9
Parent: ZSObservation
Id: ZSPHQ9
Title: "ZarishSphere PHQ-9 Depression Screening"
Description: """
  PHQ-9 (Patient Health Questionnaire-9) depression screening score.
  LOINC code: 44261-6 (PHQ-9 total score).
  Score ranges: 0-4 minimal, 5-9 mild, 10-14 moderate, 15-19 moderately severe, 20-27 severe.
  Used in mhGAP mental health programs across ZarishSphere.
"""

* code = http://loinc.org#44261-6 "Patient Health Questionnaire 9 item (PHQ-9) total score"
* value[x] only integer
* valueInteger 1..1 MS
* interpretation MS
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (extensible)
* note MS  // Clinician notes on PHQ-9 interpretation

// ----------------------------------------------------------------------------
// GAD-7 (Anxiety Screening)
// ----------------------------------------------------------------------------

Profile: ZSGAD7
Parent: ZSObservation
Id: ZSGAD7
Title: "ZarishSphere GAD-7 Anxiety Screening"
Description: "GAD-7 (Generalized Anxiety Disorder-7) anxiety screening. LOINC 69737-5."

* code = http://loinc.org#69737-5 "Generalized anxiety disorder 7 item (GAD-7) total score"
* value[x] only integer
* valueInteger 1..1 MS

// ----------------------------------------------------------------------------
// ZSEncounter Profile
// ----------------------------------------------------------------------------

Profile: ZSEncounter
Parent: Encounter
Id: ZSEncounter
Title: "ZarishSphere Encounter"
Description: "ZarishSphere clinical encounter. Mandates class, status, subject, and tenant extension."

* extension contains ZSTenantID named tenantId 1..1 MS
* status 1..1 MS
* class 1..* MS
* subject 1..1 MS
* subject only Reference(ZSPatient)
* serviceProvider MS
* serviceProvider only Reference(ZSOrganization)
* location MS
* participant MS
* period MS
* type MS
* reasonCode MS
* diagnosis MS

// ----------------------------------------------------------------------------
// ZSCondition Profile
// ----------------------------------------------------------------------------

Profile: ZSCondition
Parent: Condition
Id: ZSCondition
Title: "ZarishSphere Condition"
Description: "ZarishSphere diagnosis/condition. Uses ICD-11 or SNOMED CT for coding."

* extension contains ZSTenantID named tenantId 1..1 MS
* clinicalStatus 1..1 MS
* verificationStatus 1..1 MS
* code 1..1 MS
* code.coding 1..* MS
* code.coding.system from ZSConditionCodeSystemsValueSet (required)
* subject 1..1 MS
* subject only Reference(ZSPatient)
* recordedDate MS
* recorder MS
* onset[x] MS
* severity MS
* note MS

// ----------------------------------------------------------------------------
// ZSLocation Profile (Health Facility)
// ----------------------------------------------------------------------------

Profile: ZSLocation
Parent: Location
Id: ZSLocation
Title: "ZarishSphere Health Facility Location"
Description: "Health facility location in the ZarishSphere facility registry. Supports camps, health posts, hospitals."

* status 1..1 MS
* name 1..1 MS
* type 1..* MS
* type from ZSFacilityTypeValueSet (extensible)
* telecom MS
* address 1..1 MS
* address.country 1..1 MS
* address.district MS
* managingOrganization MS
* position MS  // GPS coordinates for geo-mapping

// ----------------------------------------------------------------------------
// ZSOrganization Profile
// ----------------------------------------------------------------------------

Profile: ZSOrganization
Parent: Organization
Id: ZSOrganization
Title: "ZarishSphere Organization"
Description: "Organization in the ZarishSphere platform (NGO, MoH, program)."

* active 1..1 MS
* type MS
* name 1..1 MS
* identifier MS
* telecom MS
* address MS
