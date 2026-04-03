.PHONY: all compile validate publish clean help
SUSHI := sushi
all: compile validate
compile: ## Compile FSH to FHIR (requires sushi: npm install -g fsh-sushi)
	$(SUSHI) .
validate: ## Validate generated resources with HAPI FHIR Validator CLI
	@if [ -f validator_cli.jar ]; then \
		java -jar validator_cli.jar -version 5.0.0 fsh-generated/resources/*.json || true; \
	else \
		echo "Download validator_cli.jar first: curl -fsSL https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -o validator_cli.jar"; \
	fi
publish: ## Run IG Publisher (requires publisher.jar)
	@if [ -f publisher.jar ]; then \
		java -jar publisher.jar -ig ig.ini; \
	else \
		echo "Download IG Publisher first"; \
	fi
clean: ## Remove generated files
	rm -rf fsh-generated output
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'
