{
  description = "Kind cluster testing framework for nix-containers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        chartRoutingJson = import ./chart-routing.nix { inherit pkgs; };

        # Chart test definitions
        chartTests = {
          infrastructure = [
            "cert-manager" "coredns" "crossplane" "keda"
            "reflector" "reloader" "external-dns" "dragonfly-operator"
            "prometheus-adapter" "snapshot-controller" "spegel"
            "cloudnative-pg"
          ];
          security = [ "vault" "kyverno" "external-secrets" ];
          observability = [ "kube-prometheus-stack" "loki" "tempo" "alloy" ];
          gitops = [ "argocd" ];
          service-mesh = [ "istio" ];
          ml-platform = [ "spark-operator" "mlflow" ];
          backup = [ "velero" ];
        };

        # Helper to create test scripts
        mkChartTest = category: chart: pkgs.writeShellScriptBin "test-${chart}" ''
          set -euo pipefail
          export PATH="${pkgs.lib.makeBinPath [ pkgs.kubectl pkgs.kubernetes-helm pkgs.kind pkgs.curl pkgs.jq ]}"

          source ${./scripts/helpers.sh}

          echo "Testing ${chart} from ${category}..."
          ${./charts/${category}/test-${chart}.sh}
        '';

        # All chart test scripts
        allChartTests = pkgs.lib.flatten (
          pkgs.lib.mapAttrsToList (category: charts:
            map (chart: mkChartTest category chart) charts
          ) chartTests
        );

        # Setup cluster script
        setupCluster = pkgs.writeShellScriptBin "kind-setup" ''
          set -euo pipefail
          export PATH="${pkgs.lib.makeBinPath [ pkgs.kind pkgs.kubectl pkgs.kubernetes-helm pkgs.docker ]}"

          CLUSTER_NAME="''${1:-nix-containers-test}"

          echo "=== Setting up Kind cluster: $CLUSTER_NAME ==="

          # Check if cluster exists
          if kind get clusters 2>/dev/null | grep -q "^$CLUSTER_NAME$"; then
            echo "Cluster $CLUSTER_NAME already exists"
            exit 0
          fi

          # Create cluster
          kind create cluster \
            --name "$CLUSTER_NAME" \
            --config ${./configs/kind-config.yaml} \
            --wait 5m

          # Create namespaces
          for ns in infrastructure ml-platform gitops security observability service-mesh backup; do
            kubectl create namespace "$ns" --dry-run=client -o yaml | kubectl apply -f -
          done

          # Add Helm repos
          helm repo add jetstack https://charts.jetstack.io 2>/dev/null || true
          helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 2>/dev/null || true
          helm repo add grafana https://grafana.github.io/helm-charts 2>/dev/null || true
          helm repo add hashicorp https://helm.releases.hashicorp.com 2>/dev/null || true
          helm repo add argoproj https://argoproj.github.io/argo-helm 2>/dev/null || true
          helm repo add istio https://istio-release.storage.googleapis.com/charts 2>/dev/null || true
          helm repo add kyverno https://kyverno.github.io/kyverno 2>/dev/null || true
          helm repo add external-secrets https://charts.external-secrets.io 2>/dev/null || true
          helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts 2>/dev/null || true
          helm repo add crossplane https://charts.crossplane.io/stable 2>/dev/null || true
          helm repo add keda https://kedacore.github.io/charts 2>/dev/null || true
          helm repo add spark-operator https://kubeflow.github.io/spark-operator 2>/dev/null || true
          helm repo update

          echo "=== Cluster $CLUSTER_NAME is ready ==="
        '';

        # Teardown cluster script
        teardownCluster = pkgs.writeShellScriptBin "kind-teardown" ''
          set -euo pipefail
          export PATH="${pkgs.lib.makeBinPath [ pkgs.kind ]}"

          CLUSTER_NAME="''${1:-nix-containers-test}"

          echo "=== Tearing down Kind cluster: $CLUSTER_NAME ==="
          kind delete cluster --name "$CLUSTER_NAME" 2>/dev/null || true
          echo "Done"
        '';

        # Load image script
        loadImage = pkgs.writeShellScriptBin "kind-load-image" ''
          set -euo pipefail
          export PATH="${pkgs.lib.makeBinPath [ pkgs.kind pkgs.docker pkgs.nix ]}"

          CLUSTER_NAME="''${1:-nix-containers-test}"
          IMAGE_NAME="''${2:-}"
          IMAGES_FLAKE="''${3:-../images}"

          if [ -z "$IMAGE_NAME" ]; then
            echo "Usage: kind-load-image <cluster-name> <image-name> [images-flake-path]"
            exit 1
          fi

          echo "Loading $IMAGE_NAME into Kind cluster $CLUSTER_NAME..."

          # Build and load
          nix build "$IMAGES_FLAKE#$IMAGE_NAME" -o /tmp/nix-img-$IMAGE_NAME

          if [ -f /tmp/nix-img-$IMAGE_NAME ]; then
            /tmp/nix-img-$IMAGE_NAME | docker load
            LOADED=$(docker images --format "{{.Repository}}:{{.Tag}}" | head -1)
            docker tag "$LOADED" "nix-containers/$IMAGE_NAME:test" 2>/dev/null || true
            kind load docker-image "nix-containers/$IMAGE_NAME:test" --name "$CLUSTER_NAME"
            rm -f /tmp/nix-img-$IMAGE_NAME
            echo "Loaded nix-containers/$IMAGE_NAME:test"
          fi
        '';

        # Run all tests script
        runAllTests = pkgs.writeShellScriptBin "kind-run-tests" ''
          set -euo pipefail
          export PATH="${pkgs.lib.makeBinPath [ pkgs.kubectl pkgs.kubernetes-helm pkgs.kind pkgs.curl pkgs.jq ]}"

          CLUSTER_NAME="''${1:-nix-containers-test}"
          CATEGORY="''${2:-all}"

          source ${./scripts/helpers.sh}

          echo "=== Running tests on cluster $CLUSTER_NAME ==="

          PASSED=0
          FAILED=0

          run_test() {
            local script="$1"
            local name="$2"
            echo "Testing $name..."
            if bash "$script" 2>&1; then
              echo "  PASS: $name"
              PASSED=$((PASSED + 1))
            else
              echo "  FAIL: $name"
              FAILED=$((FAILED + 1))
            fi
          }

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "infrastructure" ]; then
            run_test ${./charts/infrastructure/test-cert-manager.sh} "cert-manager"
            run_test ${./charts/infrastructure/test-coredns.sh} "coredns"
            run_test ${./charts/infrastructure/test-crossplane.sh} "crossplane"
            run_test ${./charts/infrastructure/test-keda.sh} "keda"
            run_test ${./charts/infrastructure/test-reflector.sh} "reflector"
            run_test ${./charts/infrastructure/test-reloader.sh} "reloader"
            run_test ${./charts/infrastructure/test-external-dns.sh} "external-dns"
            run_test ${./charts/infrastructure/test-dragonfly-operator.sh} "dragonfly-operator"
            run_test ${./charts/infrastructure/test-prometheus-adapter.sh} "prometheus-adapter"
            run_test ${./charts/infrastructure/test-snapshot-controller.sh} "snapshot-controller"
            run_test ${./charts/infrastructure/test-spegel.sh} "spegel"
            run_test ${./charts/infrastructure/test-cloudnative-pg.sh} "cloudnative-pg"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "security" ]; then
            run_test ${./charts/security/test-vault.sh} "vault"
            run_test ${./charts/security/test-kyverno.sh} "kyverno"
            run_test ${./charts/security/test-external-secrets.sh} "external-secrets"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "observability" ]; then
            run_test ${./charts/observability/test-kube-prometheus-stack.sh} "kube-prometheus-stack"
            run_test ${./charts/observability/test-loki.sh} "loki"
            run_test ${./charts/observability/test-tempo.sh} "tempo"
            run_test ${./charts/observability/test-alloy.sh} "alloy"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "gitops" ]; then
            run_test ${./charts/gitops/test-argocd.sh} "argocd"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "service-mesh" ]; then
            run_test ${./charts/service-mesh/test-istio.sh} "istio"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "ml-platform" ]; then
            run_test ${./charts/ml-platform/test-spark-operator.sh} "spark-operator"
            run_test ${./charts/ml-platform/test-mlflow.sh} "mlflow"
          fi

          if [ "$CATEGORY" = "all" ] || [ "$CATEGORY" = "backup" ]; then
            run_test ${./charts/backup/test-velero.sh} "velero"
          fi

          echo ""
          echo "=== Results ==="
          echo "Passed: $PASSED"
          echo "Failed: $FAILED"

          [ "$FAILED" -eq 0 ]
        '';

      in {
        packages = {
          # Cluster management
          setup = setupCluster;
          teardown = teardownCluster;
          load-image = loadImage;
          run-tests = runAllTests;

          # Chart <-> image routing JSON (used by CI matrix builder)
          chart-routing-json = chartRoutingJson;

          # Individual test scripts
          test-cert-manager = mkChartTest "infrastructure" "cert-manager";
          test-vault = mkChartTest "security" "vault";
          test-argocd = mkChartTest "gitops" "argocd";
          # ... more can be added

          default = runAllTests;
        };

        apps = {
          setup = flake-utils.lib.mkApp { drv = setupCluster; };
          teardown = flake-utils.lib.mkApp { drv = teardownCluster; };
          load-image = flake-utils.lib.mkApp { drv = loadImage; };
          run-tests = flake-utils.lib.mkApp { drv = runAllTests; };
          default = flake-utils.lib.mkApp { drv = runAllTests; };
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.kind
            pkgs.kubectl
            pkgs.kubernetes-helm
            pkgs.docker
            pkgs.jq
            pkgs.curl
            setupCluster
            teardownCluster
            loadImage
            runAllTests
          ];

          shellHook = ''
            echo "Kind Testing Shell"
            echo ""
            echo "Commands available:"
            echo "  kind-setup [cluster-name]     - Create Kind cluster"
            echo "  kind-teardown [cluster-name]  - Delete Kind cluster"
            echo "  kind-load-image <cluster> <image> - Load nix image"
            echo "  kind-run-tests [cluster] [category] - Run tests"
            echo ""
            echo "Or use nix run:"
            echo "  nix run .#setup"
            echo "  nix run .#teardown"
            echo "  nix run .#run-tests"
            echo ""
          '';
        };
      }
    );
}
