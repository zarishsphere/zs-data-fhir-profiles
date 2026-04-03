// ZarishSphere Value Sets and Code Systems

// ----------------------------------------------------------------------------
// ZarishSphere Code Systems
// ----------------------------------------------------------------------------

CodeSystem: ZSProgramCodes
Id: ZSProgramCodes
Title: "ZarishSphere Program Codes"
Description: "Codes for ZarishSphere health programs across countries."
* ^caseSensitive = true
* ^content = #complete
* #bgd-health "Bangladesh National Health Program"
* #bgd-rohingya "Bangladesh — Cox's Bazar Rohingya Response"
* #bgd-refugee "Bangladesh — Refugee Health Program (General)"
* #mmr-border "Myanmar — Cross-Border Health"
* #mmr-national "Myanmar — National Health Program"
* #ind-national "India — National Health Program"
* #pak-national "Pakistan — National Health Program"
* #tha-national "Thailand — National Health Program"
* #humanitarian "Humanitarian / Emergency Response (Multi-country)"
* #refugee-response "Refugee Response (UNHCR Partnership)"

CodeSystem: ZSDataEntryModes
Id: ZSDataEntryModes
Title: "ZarishSphere Data Entry Mode Codes"
Description: "Codes describing how clinical data was entered into ZarishSphere."
* ^caseSensitive = true
* ^content = #complete
* #online "Online" "Data entered while connected to the internet"
* #offline "Offline" "Data entered in offline mode (mobile/desktop app)"
* #sync "Sync" "Data synced from offline device to server"
* #imported "Imported" "Data imported from external system (DHIS2, CSV, HL7)"
* #chw "CHW Entry" "Data entered by Community Health Worker via mobile app"
* #paper-transcribed "Paper Transcribed" "Data transcribed from paper records"
* #api "API" "Data submitted via FHIR API by partner system"

CodeSystem: ZSFacilityTypeCodes
Id: ZSFacilityTypeCodes
Title: "ZarishSphere Facility Type Codes"
Description: "Types of health facilities in ZarishSphere programs."
* ^caseSensitive = true
* ^content = #complete
* #health-post "Health Post" "Community health post (smallest facility level)"
* #health-centre "Health Centre" "Health centre with outpatient services"
* #primary-care "Primary Care Clinic" "General outpatient primary care"
* #hospital "Hospital" "Inpatient hospital facility"
* #camp-health-post "Camp Health Post" "Health post within a refugee/IDP camp"
* #mobile-unit "Mobile Health Unit" "Mobile clinic / outreach unit"
* #chw-base "CHW Base" "Community Health Worker base/catchment area"
* #district-hospital "District Hospital" "Government district hospital"
* #tertiary-hospital "Tertiary Hospital" "Referral / tertiary care hospital"
* #lab "Laboratory" "Standalone laboratory facility"
* #pharmacy "Pharmacy" "Standalone pharmacy"

CodeSystem: ZSTranslationSource
Id: ZSTranslationSource
Title: "ZarishSphere Translation Source"
Description: "Identifies when a resource was translated between FHIR versions."
* ^caseSensitive = true
* ^content = #complete
* #fhir-4.0.1-to-5.0.0 "Translated from FHIR R4 to R5" "Resource was translated from FHIR R4 (4.0.1) to R5 (5.0.0) by zs-core-fhir-r4-bridge"
* #fhir-5.0.0-to-4.0.1 "Translated from FHIR R5 to R4" "Resource was translated from FHIR R5 (5.0.0) to R4 (4.0.1) by zs-core-fhir-r4-bridge"

// ----------------------------------------------------------------------------
// Value Sets
// ----------------------------------------------------------------------------

ValueSet: ZSProgramCodeValueSet
Id: ZSProgramCodeValueSet
Title: "ZarishSphere Program Codes"
Description: "Value set of ZarishSphere program codes."
* include codes from system ZSProgramCodes

ValueSet: ZSDataEntryModeValueSet
Id: ZSDataEntryModeValueSet
Title: "ZarishSphere Data Entry Mode"
Description: "Value set for data entry mode extension."
* include codes from system ZSDataEntryModes

ValueSet: ZSFacilityTypeValueSet
Id: ZSFacilityTypeValueSet
Title: "ZarishSphere Facility Types"
Description: "Types of health facilities in ZarishSphere."
* include codes from system ZSFacilityTypeCodes

ValueSet: ZSVitalSignsValueSet
Id: ZSVitalSignsValueSet
Title: "ZarishSphere Vital Signs LOINC Codes"
Description: "LOINC codes for vital signs observations in ZarishSphere."
* http://loinc.org#55284-4 "Blood pressure systolic and diastolic"
* http://loinc.org#8480-6 "Systolic blood pressure"
* http://loinc.org#8462-4 "Diastolic blood pressure"
* http://loinc.org#8867-4 "Heart rate"
* http://loinc.org#8310-5 "Body temperature"
* http://loinc.org#9279-1 "Respiratory rate"
* http://loinc.org#2708-6 "Oxygen saturation in Arterial blood"
* http://loinc.org#29463-7 "Body weight"
* http://loinc.org#8302-2 "Body height"
* http://loinc.org#39156-5 "BMI"
* http://loinc.org#56072-2 "Mid upper arm circumference"
* http://loinc.org#11884-4 "Gestational age"

ValueSet: ZSConditionCodeSystemsValueSet
Id: ZSConditionCodeSystemsValueSet
Title: "ZarishSphere Condition Code Systems"
Description: "Allowed code systems for condition/diagnosis coding in ZarishSphere. ICD-11 is primary, SNOMED CT is alternative."
* codes from system http://id.who.int/icd/release/11/mms
* codes from system http://snomed.info/sct
* codes from system http://hl7.org/fhir/sid/icd-10

ValueSet: ZSPatientLanguageValueSet
Id: ZSPatientLanguageValueSet
Title: "ZarishSphere Patient Communication Languages"
Description: "Languages supported by ZarishSphere for patient communication. Covers primary South and Southeast Asia languages."
* urn:ietf:bcp:47#en "English"
* urn:ietf:bcp:47#bn "Bengali (Bangla)"
* urn:ietf:bcp:47#my "Burmese"
* urn:ietf:bcp:47#ur "Urdu"
* urn:ietf:bcp:47#hi "Hindi"
* urn:ietf:bcp:47#th "Thai"
* urn:ietf:bcp:47#rhg "Rohingya"
* urn:ietf:bcp:47#ar "Arabic"
* urn:ietf:bcp:47#fr "French"

ValueSet: ZSEncounterTypeValueSet
Id: ZSEncounterTypeValueSet
Title: "ZarishSphere Encounter Types"
Description: "Types of clinical encounters in ZarishSphere (SNOMED CT based)."
* http://snomed.info/sct#11429006 "Consultation"
* http://snomed.info/sct#308335008 "Patient encounter procedure"
* http://snomed.info/sct#390906007 "Follow-up encounter"
* http://snomed.info/sct#185349003 "Encounter for check up"
* http://snomed.info/sct#410620009 "Well child visit"
* http://snomed.info/sct#424619006 "Prenatal visit"
* http://snomed.info/sct#310058001 "Emergency visit"
* http://snomed.info/sct#439708006 "Home visit"
* http://snomed.info/sct#698710006 "Community visit"
* http://snomed.info/sct#308720009 "Ward visit"

ValueSet: ZSImmunizationStatusValueSet
Id: ZSImmunizationStatusValueSet
Title: "ZarishSphere Immunization Status Codes"
Description: "Immunization status codes for the ZarishSphere EPI program."
* http://hl7.org/fhir/event-status#completed "Completed"
* http://hl7.org/fhir/event-status#not-done "Not Done"
* http://hl7.org/fhir/event-status#entered-in-error "Entered in Error"

ValueSet: ZSNutritionStatusValueSet
Id: ZSNutritionStatusValueSet
Title: "ZarishSphere Nutrition Status (MUAC)"
Description: "Nutrition status categories based on MUAC measurement. Used in CMAM programs."
* http://snomed.info/sct#70241007 "Nutritional deficiency disorder"
* http://snomed.info/sct#238131007 "Overweight"
* http://snomed.info/sct#2092003 "Starvation"
* https://fhir.zarishsphere.com/CodeSystem/ZSNutritionStatus#sam "Severe Acute Malnutrition (SAM)"
* https://fhir.zarishsphere.com/CodeSystem/ZSNutritionStatus#mam "Moderate Acute Malnutrition (MAM)"
* https://fhir.zarishsphere.com/CodeSystem/ZSNutritionStatus#normal "Normal Nutritional Status"
