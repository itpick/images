{ mkImage, fetchFromGitHub, buildGoModule, lib, pkgs, ... }:


# Chainguard SBOM packages for argocd:
# Packages available in nixpkgs:
#   pkgs.argocd  # argo-cd-3.2 (3.2.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnupg  # gnupg (2.4.8-r3)
#   pkgs.gpg-tui  # gpg (2.4.8-r3)
#   pkgs.helm  # helm-3 (3.19.2-r2)
#   pkgs.kustomize  # kustomize (5.8.0-r1)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libksba  # libksba (1.6.7-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.npth  # npth (1.8-r9)
#   pkgs.openssh  # openssh (10.2_p1-r2)
#   ... and 4 more
# Packages NOT in nixpkgs:
#   argo-cd-3.2-repo-server (3.2.1-r2)
#   gnupg-gpgconf (2.4.8-r3)
#   gpg-agent (2.4.8-r3)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   ... and 6 more

let
  version = "3.2.1";
  argocd = buildGoModule {
    pname = "argocd";
    inherit version;

    src = fetchFromGitHub {
      owner = "argoproj";
      repo = "argo-cd";
      rev = "v${version}";
      hash = "sha256-AkHGhRHd2ybGYdgy6rNGBdS5YaHZKL4M9oKdqPxWYO0=";
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/argoproj/argo-cd/v2/common.version=${version}"
      "-X github.com/argoproj/argo-cd/v2/common.buildDate=1970-01-01T00:00:00Z"
      "-X github.com/argoproj/argo-cd/v2/common.gitCommit=${version}"
      "-X github.com/argoproj/argo-cd/v2/common.gitTreeState=clean"
    ];

    # Build main CLI and all server components
    subPackages = [
      "cmd/argocd"
      "cmd/argocd-server"
      "cmd/argocd-application-controller"
      "cmd/argocd-repo-server"
      "cmd/argocd-dex"
      "cmd/argocd-applicationset-controller"
      "cmd/argocd-notification"
      "cmd/argocd-k8s-auth"
      "cmd/argocd-git-ask-pass"
      "cmd/argocd-cmp-server"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Declarative GitOps CD for Kubernetes";
      homepage = "https://github.com/argoproj/argo-cd";
      license = licenses.asl20;
      maintainers = with maintainers; [ ];
    };
  };

in
mkImage {
  drv = argocd;
  name = "argocd";
  tag = "v${version}";
  entrypoint = [ "${argocd}/bin/argocd" ];
  cmd = [ "--help" ];
  # Chainguard runs argocd as user 999
  user = "999:999";

  # Additional packages from Chainguard SBOM
  extraPkgs = with pkgs; [
    git
    git-lfs
    gnupg
    helm
    kustomize
    openssh
    busybox
  ];

  labels = {
    "org.opencontainers.image.title" = "Argo CD";
    "org.opencontainers.image.description" = "Declarative GitOps CD for Kubernetes";
    "org.opencontainers.image.version" = version;
    "org.opencontainers.image.source" = "https://github.com/argoproj/argo-cd";
    "io.nix-containers.chart" = "argocd";
  };
}
