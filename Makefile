# Makefile for testing nix-containers builds

.PHONY: help test-all test-image list-images cleanup

help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

list-images: ## List all available images using Nix discovery
	@echo "📋 Available images (via Nix discovery):"
	@nix eval --json .#discoveredImages | jq -r '.[]' | sed 's/^/  - /'
	@echo ""
	@echo "📋 Available images (via traditional method):"
	@nix eval --json .#imageNames | jq -r '.[]' | sed 's/^/  - /'

test-image: ## Test build for specific image (usage: make test-image IMAGE=bash)
	@if [ -z "$(IMAGE)" ]; then \
		echo "Error: Please specify IMAGE=<name>"; \
		echo "Example: make test-image IMAGE=bash"; \
		exit 1; \
	fi
	@./scripts/test-image-build.sh image $(IMAGE)

test-all: ## Build and test all images locally
	@./scripts/test-image-build.sh all

verify: ## Run all 3 verification tests
	@./scripts/verify-builds.sh all

verify-discovery: ## Test 1: Verify Nix-based image discovery
	@./scripts/verify-builds.sh discovery

verify-builds: ## Test 2: Verify nix2container builds
	@./scripts/verify-builds.sh builds

verify-docker: ## Test 3: Verify Docker loading and functionality
	@./scripts/verify-builds.sh docker

test-comprehensive: ## Run comprehensive test suite via Nix
	@echo "🧪 Running comprehensive test suite..."
	@nix run .#test-all-images

test-single: ## Test specific image with custom tests (usage: make test-single IMAGE=bash)
	@if [ -z "$(IMAGE)" ]; then \
		echo "Error: Please specify IMAGE=<name>"; \
		echo "Example: make test-single IMAGE=bash"; \
		exit 1; \
	fi
	@echo "🧪 Testing $(IMAGE) with custom tests..."
	@if nix build .#$(IMAGE)-test 2>/dev/null; then \
		echo "Running comprehensive tests for $(IMAGE)..."; \
		nix run .#$(IMAGE)-test; \
	else \
		echo "No custom tests found for $(IMAGE), running basic test..."; \
		make test-image IMAGE=$(IMAGE); \
	fi

list-tests: ## List images that have custom tests
	@echo "📋 Images with custom tests:"
	@for img in images/*/test.nix; do \
		if [ -f "$$img" ]; then \
			echo "  - $$(basename $$(dirname $$img))"; \
		fi \
	done

load-with-version: ## Load image with both latest and version tags (usage: make load-with-version IMAGE=python)
	@if [ -z "$(IMAGE)" ]; then \
		echo "Error: Please specify IMAGE=<name>"; \
		echo "Example: make load-with-version IMAGE=python"; \
		exit 1; \
	fi
	@echo "🔄 Loading $(IMAGE) image with version tags..."
	@nix run .#$(IMAGE).copyTo -- docker-daemon:$(IMAGE):latest
	@VERSION=$$(docker inspect $(IMAGE):latest --format '{{ index .Config.Labels "org.opencontainers.image.version" }}' 2>/dev/null || echo "latest"); \
	COMPRESSED_SIZE=$$(docker save $(IMAGE):latest | gzip | wc -c); \
	IMAGE_ID=$$(docker images $(IMAGE):latest --format "{{.ID}}"); \
	echo "📏 Compressed size: $$COMPRESSED_SIZE bytes"; \
	docker build -t $(IMAGE):temp - <<< "FROM $$IMAGE_ID\nLABEL org.opencontainers.image.size=\"$$COMPRESSED_SIZE\""; \
	docker tag $(IMAGE):temp $(IMAGE):latest; \
	docker rmi $(IMAGE):temp 2>/dev/null || true; \
	if [ "$$VERSION" != "latest" ]; then \
		docker tag $(IMAGE):latest $(IMAGE):$$VERSION; \
		echo "✅ Tagged $(IMAGE):latest as $(IMAGE):$$VERSION"; \
	else \
		echo "ℹ️  No version available for $(IMAGE)"; \
	fi

cleanup: ## Clean up test artifacts and Docker images
	@./scripts/test-image-build.sh cleanup

# Quick test targets for common images
test-bash: ## Test bash image
	@./scripts/test-image-build.sh image bash

test-nix: ## Test nix image  
	@./scripts/test-image-build.sh image nix

test-curl: ## Test curl image
	@./scripts/test-image-build.sh image curl