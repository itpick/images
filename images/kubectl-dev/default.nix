{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kubectl + cluster-operations toolkit, tagged kubectl-dev.
#
# Replaces multi-tool bundles like alpine/k8s for interactive cluster work
# (kubectl exec into a debug pod, ad-hoc kustomize/helm runs, secrets edits).
# Bundles kubectl with a shell and the tools you typically reach for in a
# cluster shell — but stays as light as is reasonable.

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };
  netFix = "golang.org/x/net@v0.62.0";

  # kubectl from the same Kubernetes release as nixpkgs, built as a plain Go
  # module so its vendored dependencies can be bumped. nixpkgs builds it via
  # the Kubernetes Makefile against the in-tree vendor/, which pins x/net 0.57
  # (GO-2026 Criticals fixed in 0.60). The staging replace directives in
  # go.mod still resolve, since the whole source tree is present.
  kubectl = pkgs.buildGoModule ({
    pname = "kubectl";
    inherit (pkgs.kubectl) version src;
    vendorHash = "sha256-p8NbO2BDQlN9G4IZUUnDOPUzgmuxDwC7gWrje9iVRsg=";
    subPackages = [ "cmd/kubectl" ];
    # go.work at the repo root puts `go mod vendor` in workspace mode.
    env = { CGO_ENABLED = 0; GOWORK = "off"; };
    ldflags = [
      "-s" "-w"
      "-X k8s.io/client-go/pkg/version.gitVersion=v${pkgs.kubectl.version}"
      "-X k8s.io/component-base/version.gitVersion=v${pkgs.kubectl.version}"
    ];
    doCheck = false;
    meta.mainProgram = "kubectl";
  } // goModBump [ netFix ]);

  sops = pkgs.sops.overrideAttrs (o:
    let b = goModBump [
      netFix
      "google.golang.org/grpc@v1.83.2"
      "github.com/go-jose/go-jose/v4@v4.1.6"
    ]; in {
      vendorHash = "sha256-xigysI19GGKL2bIhZ1jgiD6SUahoQimdIS0fEGC7Q/c=";
      preBuild = (o.preBuild or "") + b.preBuild;
      passthru = (o.passthru or { }) // { inherit (b) overrideModAttrs; };
    });

  # HTTP(S)-only curl. The default build links libssh2 (scp/sftp) and krb5
  # (GSSAPI), which carry High/Critical CVEs with no fixed release yet and
  # are not needed for cluster debugging. (curlMinimal is not minimal here:
  # it resolves to the same derivation as curl.)
  curlHttp = pkgs.curlMinimal.override { scpSupport = false; gssSupport = false; };
  # Same for dig/nslookup: GSS-TSIG is the only thing pulling krb5 back in.
  bindNoGss = pkgs.bind.override { enableGSSAPI = false; };

  devPackages = with pkgs; [
    # Kubernetes
    kubectl
    kustomize
    kubernetes-helm

    # Shell + core utilities
    bash
    coreutils
    findutils
    gnused
    gnugrep
    gnutar
    gzip
    less

    # Network / debug
    curlHttp
    wget
    bindNoGss.dnsutils  # dig, nslookup
    iputils         # ping
    openssl         # cert inspection
    netcat-gnu

    # JSON / YAML
    jq
    yq-go

    # Secrets handling
    sops
    age

    # Editor
    vim
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
nix2container.buildImage {
  name = "kubectl-dev";
  tag  = "v${kubectl.version}-dev";

  copyToRoot = [
    (buildEnv {
      name  = "kubectl-dev-root";
      paths = base.basePackages ++ devPackages ++ [ userEnv ];
    })
  ];

  config = {
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Cmd        = [];
    User       = nonRoot.userString;
    WorkingDir = "/home/${nonRoot.user.name}";
    Env = [
      "KUBECONFIG=/home/${nonRoot.user.name}/.kube/config"
      "HOME=/home/${nonRoot.user.name}"
      "LANG=C.UTF-8"
      "TERM=xterm-256color"
    ];
    Labels = {
      "org.opencontainers.image.title"       = "kubectl-dev";
      "org.opencontainers.image.description" = "kubectl + cluster-ops toolkit (bash, kustomize, helm, jq, yq, curl, sops, age, vim) for interactive cluster work";
      "org.opencontainers.image.url"         = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source"      = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor"      = "nix-containers";
      "org.opencontainers.image.version"     = "v${kubectl.version}-dev";
      "io.nix-containers.image.upstream"     = "https://kubernetes.io/";
      "io.nix-containers.image.category"     = "devops-tool";
      "io.nix-containers.image.aliases"      = "kubectl-dev,k8s-toolkit,cluster-shell";
      "io.nix-containers.image.variant"      = "dev-bundle";
    };
  };
}
