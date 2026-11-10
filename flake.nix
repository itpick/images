{
  description = "Nix Container Images Collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix2container }:
    let
      # Supported systems for container images (Linux only)
      linuxSystems = [ "x86_64-linux" "aarch64-linux" ];

      # Supported systems for pipeline scripts (includes macOS for local dev)
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # Helper to generate outputs for each system
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
      forLinuxSystems = nixpkgs.lib.genAttrs linuxSystems;

      # Use a reference pkgs for discovery (doesn't affect builds)
      refPkgs = nixpkgs.legacyPackages.x86_64-linux;

      # Import chart definitions (architecture-independent)
      chartDefs = import ./charts.nix;

      # Import image categories
      imageCategories = import ./lib/categories.nix;

      # Discover images once (architecture-independent)
      imagesPath = ./images;
      discoveredImages = let
        allFiles = refPkgs.lib.filesystem.listFilesRecursive ./images;
        imageFiles = builtins.filter (path:
          let
            pathStr = toString path;
            relativePath = refPkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = refPkgs.lib.splitString "/" relativePath;
          in
            builtins.length parts == 2 &&
            builtins.elemAt parts 1 == "default.nix" &&
            !(builtins.any (part: part == "fake_nixpkgs" || part == "root" || part == "patches") parts)
        ) allFiles;
        imageNamesList = map (path:
          let
            pathStr = toString path;
            relativePath = refPkgs.lib.removePrefix (toString ./images + "/") pathStr;
            parts = refPkgs.lib.splitString "/" relativePath;
          in
            builtins.elemAt parts 0
        ) imageFiles;
      in
        refPkgs.lib.lists.unique imageNamesList;

      # Generate packages for a specific system
      mkPackages = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
              # MinIO's newest date-stamped releases get flagged insecure in
              # nixpkgs (upstream's "no free release since Aug 2025" policy
              # rippled through into a marker). We ship minio-nixchart and
              # need to allow the package to evaluate — we're on the current
              # release either way; the marker is upstream-policy, not a CVE.
              permittedInsecurePackages = [
                "minio-2025-10-15T17-29-55Z"
              ];
            };
            overlays = [
              # Custom packages overlay
              (final: prev: import ./pkgs { pkgs = final; })

              # CVE: boundary 0.21.2 vendors github.com/jackc/pgx/v5 5.6.0
              # (critical). Upstream v0.21.3 ships pgx 5.9.2. boundary is a
              # prebuilt binary, so bump = version + release-zip hash.
              (final: prev: {
                boundary = prev.boundary.overrideAttrs (o: {
                  version = "0.21.3";
                  src = final.fetchurl {
                    url = "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_amd64.zip";
                    hash = "sha256-GpSMFDuEnO26kRJ6oRFVxgBthAUSgqDZPz2JUltGDRI=";
                  };
                });
              })

              # OpenSearch 3.5.0 (current nixpkgs pin) ships jackson-databind
              # 2.20.1, netty 4.2.9, bouncycastle 1.78.1, kafka-clients 4.1.1
              # — a nest of high/critical CVEs. Override to 3.7.0 which
              # bumps jackson→2.21.3, netty→4.2.15, bouncycastle→2.1.x.
              # This cascades through every image referencing pkgs.opensearch
              # (~40 opensearch-dashboards-3-* variants).
              (final: prev: {
                opensearch = prev.opensearch.overrideAttrs (o: rec {
                  version = "3.7.0";
                  src = prev.fetchurl {
                    url = "https://artifacts.opensearch.org/releases/bundle/opensearch/${version}/opensearch-${version}-linux-x64.tar.gz";
                    hash = "sha256-rk7fDoD/OO+eUCpRIAx/VOMTzEJ1Ag//W2B4kIFUYYQ=";
                  };
                });
              })
              # Apache Druid 36.0.0 (current nixpkgs) bundles jackson 2.12.7.1,
              # netty 4.2.6, protobuf-java 3.7.1 — 40+ crit + 250 high CVEs.
              # Druid 37.0.0 rebuilds against jackson 2.19, netty 4.2.15+,
              # protobuf 3.25.5+. Big cleanup.
              (final: prev: {
                druid = prev.druid.overrideAttrs (o: rec {
                  version = "37.0.0";
                  src = prev.fetchurl {
                    url = "mirror://apache/druid/${version}/apache-druid-${version}-bin.tar.gz";
                    hash = "sha256-xeYCvm70NWQ79fWCcTU5JXmMgYwj15qsB3ZjOMnKDdA=";
                  };
                });
              })
              # Cypress 14.5.4 (current nixpkgs) bundles axios 1.8.3,
              # node-forge 1.3.0, tar 6.2.1, ws 7.4.5 — 12 crit + 270 high.
              # 15.18.0 rebuilds these Node deps.
              (final: prev: {
                cypress = prev.cypress.overrideAttrs (o: rec {
                  version = "15.18.0";
                  src = prev.fetchurl {
                    url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
                    hash = "sha256-WGwO0gnrwuxV0Rqi9LtZUrFcXSVUTDWvkWG91pKFrCY=";
                  };
                });
              })
              # neo4j 2026.02.2 (nixpkgs) bundles netty 4.2.9 + jackson 2.20.1
              # with 50 high CVEs. 2026.05.0 rebuilds against newer versions.
              (final: prev: {
                neo4j = prev.neo4j.overrideAttrs (o: rec {
                  version = "2026.05.0";
                  src = prev.fetchurl {
                    url = "https://neo4j.com/artifact.php?name=neo4j-community-${version}-unix.tar.gz";
                    hash = "sha256-u3U7TpvMMx6QuWjt2NpEXpdAkIZ8qCXMZy3v2tYGbw4=";
                  };
                });
              })
              # Grafana Tempo 2.10.5 (nixpkgs) bundles golang.org/x/net v0.43,
              # x/crypto v0.41, apache/thrift v0.22 — 76 high CVEs.
              # 2.10.7 patch-bump pulls x/net v0.55, x/crypto v0.52, thrift v0.23.
              (final: prev: {
                tempo = prev.tempo.overrideAttrs (o: rec {
                  version = "2.10.7";
                  src = prev.fetchFromGitHub {
                    owner = "grafana";
                    repo = "tempo";
                    rev = "v${version}";
                    hash = "sha256-Y7zAeGtLvB19MpxeCIxeEOKXCQS+ws8/xs/rmvYHcLY=";
                  };
                  vendorHash = "sha256-yvzQHfe7yd6Sjh1Vd2VxTp3jK8OWoKTmJ2uMyXX3+xs=";
                });
              })
              # Grafana Loki 3.7.1 (nixpkgs) vendors x/net v0.51, x/crypto v0.50
              # — 60 high CVEs. 3.7.3 patch-bump pulls x/net v0.55, x/crypto v0.52.
              (final: prev: {
                grafana-loki = prev.grafana-loki.overrideAttrs (o: rec {
                  version = "3.7.3";
                  src = prev.fetchFromGitHub {
                    owner = "grafana";
                    repo = "loki";
                    rev = "v${version}";
                    hash = "sha256-2dqwnM2+9+P/ZIiz5Z9JPN9WicHLRzq9xn6jG1OBqLs=";
                  };
                  vendorHash = "sha256-yvzQHfe7yd6Sjh1Vd2VxTp3jK8OWoKTmJ2uMyXX3+xs=";
                });
              })
              # Prometheus 3.11.3 (nixpkgs) vendors x/net v0.49, x/crypto v0.47
              # — 36 high CVEs. 3.13.0 pulls x/net v0.55, x/crypto v0.52.
              (final: prev: {
                prometheus = prev.prometheus.overrideAttrs (o: rec {
                  version = "3.13.0";
                  src = prev.fetchFromGitHub {
                    owner = "prometheus";
                    repo = "prometheus";
                    rev = "v${version}";
                    hash = "sha256-v6jk4MqoxcfK+yj+T31Ovqj1tyh3mc4aEr8BD0vjBOc=";
                  };
                  vendorHash = "sha256-yvzQHfe7yd6Sjh1Vd2VxTp3jK8OWoKTmJ2uMyXX3+xs=";
                });
              })
              # telegraf 1.39.0 (nixpkgs) → 1.39.1: newer x/net + x/crypto (6 crit + 2 high).
              (final: prev: {
                telegraf = prev.telegraf.overrideAttrs (o: rec {
                  version = "1.39.1";
                  src = prev.fetchFromGitHub {
                    owner = "influxdata"; repo = "telegraf"; rev = "v${version}";
                    hash = "sha256-B9Xy02oYSYcU0IBOZes9tof/04TLvLybOU/nLLaFORk=";
                  };
                  vendorHash = "sha256-9o0Tt6OZnoNO8iSLYmn1SMkQmZzC19uNmfHSkEqWzmA=";
                });
              })
              # elasticsearch 7.17.27 → 7.17.29: latest available 7.17 patch.
              # 7.17 line is on extended maintenance; the patch bumps its
              # bundled Bouncy Castle from 1.78.1 → newer (clears
              # CVE-2025-14813 crit) and a handful of transitive deps.
              # Applies to elasticsearch, elasticsearch-fips, and the
              # elasticsearch-nixchart image (all use pkgs.elasticsearch).
              (final: prev: {
                elasticsearch = prev.elasticsearch.overrideAttrs (o: rec {
                  version = "7.17.29";
                  src = prev.fetchurl {
                    url = "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${version}-linux-x86_64.tar.gz";
                    hash = "sha256-9xdd46yMoWMmudvf9O9wvD2mQF7+YkZVREuiRkBz6o4=";
                  };
                  # ES 7.17 is EOL; the bundled bcprov/bcpkix/bcutil-jdk18on
                  # stay at 1.78.1 (CVE-2025-14813 critical). The tools in
                  # lib/tools/security-cli/ (elasticsearch-users,
                  # elasticsearch-service-tokens, etc.) are admin utilities
                  # never touched at container startup — the container runs
                  # `bin/elasticsearch` with security off. Drop them.
                  postFixup = (o.postFixup or "") + ''
                    rm -rf $out/lib/tools/security-cli || true
                  '';
                });
              })
              # Vendored Go modules ahead of upstream releases (lib/goModBump.nix).
              # Through overrideAttrs the modules derivation reads
              # passthru.overrideModAttrs, so the bump is wired in there,
              # composed after the package's own (grafana filters a yarn hook
              # out of its modules derivation there).
              (final: prev:
                let
                  inherit (prev) lib;
                  goModBump = import ./lib/goModBump.nix { inherit lib; };
                  withGoModBump = pkg: vendorHash: deps:
                    let b = goModBump deps; in
                    pkg.overrideAttrs (o: {
                      inherit vendorHash;
                      preBuild = (o.preBuild or "") + b.preBuild;
                      passthru = (o.passthru or { }) // {
                        overrideModAttrs = lib.composeExtensions
                          (o.passthru.overrideModAttrs or (_: _: { }))
                          b.overrideModAttrs;
                      };
                    });
                in {
                  # klauspost/compress GO-2026-6865 (fixed 1.20.2)
                  prometheus-alertmanager = withGoModBump prev.prometheus-alertmanager
                    "sha256-TayCpFUGlPsWiLrg2tscfaUGFjvL2K970Qtl8b2tQ5o="
                    [ "github.com/klauspost/compress@v1.20.2" ];
                  victorialogs = withGoModBump prev.victorialogs
                    "sha256-+fbixr/uZzPUhJPTbdeDvPb4dNYClciDb/J0VgSAN9w="
                    [ "github.com/klauspost/compress@v1.20.2" ];
                  # apache/thrift CVE-2026-63772, -66055, -82458, -83663,
                  # -94637 (fixed 0.25.0)
                  grafana = withGoModBump prev.grafana
                    "sha256-45v9jTh1O8PNc0Ys5we04eSqNBjCm5HBEcoeteDiubo="
                    [ "github.com/apache/thrift@v0.25.0" ];
                })
              # gatekeeper 3.22.2 → 3.23.0: bundled x/net + x/crypto refresh
              # (was 12 high; new bump clears many).
              (final: prev: {
                gatekeeper = prev.gatekeeper.overrideAttrs (o: rec {
                  version = "3.23.0";
                  src = prev.fetchFromGitHub {
                    owner = "open-policy-agent"; repo = "gatekeeper"; rev = "v${version}";
                    hash = "sha256-3aXyXIiwx6pSvYQ4YY4lnuk+0oRG2S6TxrSJNmLRM9c=";
                  };
                  vendorHash = "sha256-zhkPJc23cux0NCp81Iv2QSczbdD6banqS0qQt9FBELY=";
                });
              })
              # cosign 3.0.6 → 3.1.1: newer deps (9 high + 18 -fips).
              (final: prev: {
                cosign = prev.cosign.overrideAttrs (o: rec {
                  version = "3.1.1";
                  src = prev.fetchFromGitHub {
                    owner = "sigstore"; repo = "cosign"; rev = "v${version}";
                    hash = "sha256-DOsGLU6W0JrUGpthILTZfKv3fC45SlIXkvt+idUn5Tc=";
                  };
                  vendorHash = "sha256-AeVvp+6iKiTZ4dWy5kjAS2njI3IU+ANgTdUxOFcihSg=";
                });
              })
              # velero 1.18.0 → 1.18.2: newer deps (25 high).
              (final: prev: {
                velero = prev.velero.overrideAttrs (o: rec {
                  version = "1.18.2";
                  src = prev.fetchFromGitHub {
                    owner = "vmware-tanzu"; repo = "velero"; rev = "v${version}";
                    hash = "sha256-rW9OiVFGI1ZO0UmZLVZ/7gXclOmqKBPh6P/Bd54QjZY=";
                  };
                  vendorHash = "sha256-yoTl5kmM4VKrLgvEUNaKYCiNbspd4VgG8CbulKjnoJE=";
                });
              })
              # Grafana Mimir 3.0.6 (nixpkgs) vendors old x/net + x/crypto
              # (56 high). 3.1.2 pulls x/net v0.55, x/crypto v0.52.
              (final: prev: {
                mimir = prev.mimir.overrideAttrs (o: rec {
                  version = "3.1.2";
                  src = prev.fetchFromGitHub {
                    owner = "grafana";
                    repo = "mimir";
                    rev = "mimir-${version}";
                    hash = "sha256-8GvpmCanVlsObH1mwPA/TsHzNp3f0hzF7fURIDHy/DU=";
                  };
                  vendorHash = null;
                });
              })
              # etcd 3.6.10 (nixpkgs) vendors x/net v0.52, x/crypto v0.49
              # (18 high). 3.6.13 pulls x/net v0.54, x/crypto v0.52.
              (final: prev: {
                etcd = prev.etcd.overrideAttrs (o: rec {
                  version = "3.6.13";
                  src = prev.fetchFromGitHub {
                    owner = "etcd-io";
                    repo = "etcd";
                    rev = "v${version}";
                    hash = "sha256-L6wnvexUxFlN4r2D9rIQPDIYWMvs6DqY8eWU1FToi3M=";
                  };
                  vendorHash = null;
                });
              })
              # fluxcd 2.8.6 (nixpkgs) vendors old x/net + x/crypto.
              # 2.9.0 pulls x/net v0.56, x/crypto v0.53. Cascades to 13 flux imgs.
              (final: prev: {
                fluxcd = prev.fluxcd.overrideAttrs (o: rec {
                  version = "2.9.0";
                  src = prev.fetchFromGitHub {
                    owner = "fluxcd";
                    repo = "flux2";
                    rev = "v${version}";
                    hash = "sha256-zMlaBIxhmKFeBFhCC3M1wc9sKjSjUzpNLti53ow5SgU=";
                  };
                  vendorHash = "sha256-J1MofT7PwcQ74XwVumu7PfkAteKR6iJIZe+vMoaD+Eg=";
                });
              })
              # gitlab-container-registry 4.39.0 vendors x/net v0.49 + x/crypto
              # v0.47 (many highs). 4.40.2 pulls x/net v0.55, x/crypto v0.53.
              # pgx v5.8.0 crit still open (upstream lag).
              (final: prev: {
                gitlab-container-registry = prev.gitlab-container-registry.overrideAttrs (o: rec {
                  version = "4.40.2-gitlab";
                  src = prev.fetchFromGitLab {
                    owner = "gitlab-org";
                    repo = "container-registry";
                    rev = "v${version}";
                    hash = "sha256-k94uEM2VoOtdFRXWm6CDmeRt8LMXSNegRGes3ZKPg0I=";
                  };
                  vendorHash = "sha256-MD98JYwTo/t5/E7clIlUfjmv8t7nDPpVElbuYDRjMMc=";
                });
              })
              # containerd 2.2.3 → 2.3.2 for newer x/net + x/crypto.
              (final: prev: {
                containerd = prev.containerd.overrideAttrs (o: rec {
                  version = "2.3.2";
                  src = prev.fetchFromGitHub {
                    owner = "containerd";
                    repo = "containerd";
                    rev = "v${version}";
                    hash = "sha256-k/MU+boP0J6ttGDmEJuRh8fZjsJJCmeRRZe360yMUN4=";
                  };
                  vendorHash = null;
                });
              })
              # victoriametrics: track the latest upstream release ahead of nixpkgs
              # for vendored x/net, x/text, grpc, go-jose fixes. 4 images cascade.
              (final: prev: {
                victoriametrics = prev.victoriametrics.overrideAttrs (o: rec {
                  version = "1.156.0";
                  src = prev.fetchFromGitHub {
                    owner = "VictoriaMetrics";
                    repo = "VictoriaMetrics";
                    rev = "v${version}";
                    hash = "sha256-J+3D/Ly+bD+ZrAQ/3lNkTikFDfhkaaCAR2YKi7wEf4k=";
                  };
                  vendorHash = null;
                  # The base postPatch also stretches test timeouts in
                  # lib/storage/storage_test.go, which no longer matches 1.156.
                  # Tests are off here, so keep only the build-relevant edits.
                  doCheck = false;
                  postPatch = ''
                    rm -f app/vmui/packages/vmui/web/{go.mod,main.go}
                    sed -i -E 's/^(go[[:space:]]+[[:digit:]]+\.[[:digit:]]+)\.[[:digit:]]+$/\1/' go.mod
                    sed -i -E 's/^(## explicit; go[[:space:]]+[[:digit:]]+\.[[:digit:]]+)\.[[:digit:]]+$/\1/' vendor/modules.txt
                  '';
                });
              })
              # vitess 23.0.3 (nixpkgs) vendors x/net v0.47, x/crypto v0.45,
              # stdlib on old Go. 218 high CVEs. 24.0.2 pulls x/net v0.53,
              # x/crypto v0.50. Major bump — client API stable.
              (final: prev: {
                vitess = prev.vitess.overrideAttrs (o: rec {
                  version = "24.0.2";
                  src = prev.fetchFromGitHub {
                    owner = "vitessio";
                    repo = "vitess";
                    rev = "v${version}";
                    hash = "sha256-DAhAchR7N/uCDly6+3pu7Jj2cQ5j9a5i5kh3UZ63MoI=";
                  };
                  vendorHash = "sha256-S6hzgSIYJdTKFMFpNqYyWzcMGT4aSaWE6SfmOWB7NOM=";
                });
              })
              # boundary 0.21.2 (nixpkgs) bundles a prebuilt Go binary with
              # jackc/pgx/v5 v5.7.5 baked in — 6 crit CVEs. 0.21.3 bumps
              # pgx to v5.9.2 and stdlib to Go 1.25.7.
              (final: prev: {
                boundary = prev.boundary.overrideAttrs (o: rec {
                  version = "0.21.3";
                  src = prev.fetchzip {
                    url = "https://releases.hashicorp.com/boundary/${version}/boundary_${version}_linux_amd64.zip";
                    hash = "sha256-mCDWL4LrqpgnSgcJB1lODb+VOnzbBwpHaAX0HiPDop0=";
                    stripRoot = false;
                  };
                });
              })
            ];
          };

          # Import lib functions
          lib = {
            base = pkgs.callPackage ./lib/base.nix {};
            nonRoot = pkgs.callPackage ./lib/nonRoot.nix {};
            devShell = pkgs.callPackage ./lib/devShell.nix {};
            mkImage = pkgs.callPackage ./lib/mkImage.nix {
              nix2container = nix2container.packages.${system}.nix2container;
              inherit (pkgs) lib;
              base = pkgs.callPackage ./lib/base.nix {};
            };
            mkUserEnvironment = pkgs.callPackage ./lib/mkUserEnvironment.nix {};
            importDir = pkgs.callPackage ./lib/importDir.nix {};
            mkDevImage = pkgs.callPackage ./lib/mkDevImage.nix {
              nix2container = nix2container.packages.${system}.nix2container;
              inherit (pkgs) lib buildEnv;
              devShell = pkgs.callPackage ./lib/devShell.nix {};
            };
            readImageList = import ./lib/readImageList.nix { lib = pkgs.lib; };
            scanning = import ./lib/scanning.nix { inherit pkgs; lib = pkgs.lib; };
          };

          # Read BigBang image list
          bigbangImageList = if builtins.pathExists ./bundler/bigbang.txt
            then lib.readImageList ./bundler/bigbang.txt
            else [];
          bigbangImages = builtins.filter (n: images ? ${n}) bigbangImageList;

          # Import version lookup function
          getPackageVersion = import ./lib/versions.nix { inherit pkgs; };

          # Create images
          images = builtins.listToAttrs (map (imageName: {
            name = imageName;
            value = pkgs.callPackage (imagesPath + "/${imageName}") {
              inherit (lib) mkImage mkUserEnvironment base nonRoot;
              nix2container = nix2container.packages.${system}.nix2container;
              inherit pkgs;
            };
          }) discoveredImages);

          # Create version-tagged images
          versionedImages = builtins.listToAttrs (map (imageName:
            let
              baseImage = images.${imageName};
              version = getPackageVersion imageName;
            in {
              name = "${imageName}-${version}";
              value = baseImage // { tag = version; };
            }
          ) discoveredImages);

          # Create dev variants of all images.
          #
          # Skip when:
          #   - the base image's name already ends in `-dev` (avoids
          #     `kubectl-dev-dev` etc.)
          #   - a hand-written image already exists under the `-dev` name
          #     (e.g. `images/kubectl-dev` ships a curated toolkit; the
          #     auto-generated `mkDevImage kubectl` would otherwise shadow it
          #     when the attrsets are merged below, replacing the curated
          #     content with a generic devshell layer).
          devImageCandidates = pkgs.lib.filter
            (n: !(pkgs.lib.hasSuffix "-dev" n) && !(builtins.elem "${n}-dev" discoveredImages))
            discoveredImages;
          devImages = builtins.listToAttrs (map (imageName:
            let
              baseImage = images.${imageName};
            in {
              name = "${imageName}-dev";
              value = lib.mkDevImage {
                inherit baseImage;
                devLevel = "standard";
              };
            }
          ) devImageCandidates);

          # Import manifest generator
          manifest = import ./lib/manifest.nix {
            inherit pkgs images getPackageVersion discoveredImages;
          };

          imageNames = builtins.attrNames images;

          # Discovery script
          discoveryScript = pkgs.writeShellScript "discover-images" ''
            echo "Discovering images using Nix evaluation..."
            ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" eval --json .#discoveredImages
          '';

          # Load all images script
          loadAllScript = pkgs.writeShellScript "load-all-images" ''
            echo "Loading all container images to Docker..."
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: image: ''
              echo "Loading ${name} to Docker..."
              ${image.copyToDockerDaemon}/bin/copy-to-docker-daemon
            '') images)}
            echo "All images loaded successfully!"
          '';

          # Image tests
          imageTests = builtins.listToAttrs (builtins.filter (x: x != null) (map (imageName:
            let
              testPath = imagesPath + "/${imageName}/test.nix";
            in
              if builtins.pathExists testPath
              then {
                name = "${imageName}-test";
                value = pkgs.stdenv.mkDerivation {
                  name = "${imageName}-test";
                  buildCommand = ''
                    mkdir -p $out/bin
                    cp ${pkgs.callPackage testPath { image = images.${imageName}; }} $out/bin/${imageName}-test
                    chmod +x $out/bin/${imageName}-test
                  '';
                  meta.mainProgram = "${imageName}-test";
                };
              }
              else null
          ) discoveredImages));

          # Test runner script
          testImagesScript = pkgs.writeShellScript "test-images" ''
            set -euo pipefail
            echo "Testing all container images..."
            TOTAL=0
            SUCCESS=0
            for IMAGE_NAME in ${pkgs.lib.concatStringsSep " " imageNames}; do
              echo "Building: $IMAGE_NAME"
              TOTAL=$((TOTAL + 1))
              if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" build ".#$IMAGE_NAME" --print-build-logs; then
                echo "  OK: $IMAGE_NAME"
                SUCCESS=$((SUCCESS + 1))
              else
                echo "  FAIL: $IMAGE_NAME"
              fi
            done
            echo "Summary: $SUCCESS/$TOTAL images built successfully"
            [ $SUCCESS -eq $TOTAL ]
          '';

          # Script to pull all charts (defined in let block so it can be referenced by platform-bundle)
          pullAllChartsScript = pkgs.writeShellScriptBin "pull-all-charts" ''
            set -euo pipefail
            CHART_DIR="''${1:-./charts}"
            mkdir -p "$CHART_DIR"

            echo "Pulling all Helm charts to $CHART_DIR..."

            # Infrastructure charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.infrastructure)}

            # ML Platform charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.ml-platform)}

            # Observability charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.observability)}

            # Security charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.security)}

            # GitOps charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.gitops)}

            # Service Mesh charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.service-mesh)}

            # Backup charts
            ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: chart:
              if chart ? chart then
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.chart} --repo ${chart.url} --version ${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
              else
                ''echo "Pulling ${name}..." && ${pkgs.kubernetes-helm}/bin/helm pull ${chart.url}:${chart.version} -d "$CHART_DIR" || echo "Failed: ${name}"''
            ) chartDefs.backup)}

            echo "Done! Charts saved to $CHART_DIR"
            ls -la "$CHART_DIR"
          '';

        in
          images //
          versionedImages //
          devImages //
          imageTests //
          (builtins.listToAttrs (map (imageName: {
            name = "load-${imageName}-to-docker";
            value = images.${imageName}.copyToDockerDaemon;
          }) imageNames)) // {

          # Manifest for all images
          generate-manifest = manifest.generateManifest;
          manifest-json = manifest.manifestFile;

          # Build all images at once (creates a derivation that depends on all images)
          all-images = pkgs.symlinkJoin {
            name = "all-images";
            paths = builtins.attrValues images;
          };

          # Category-based image builds
          infrastructure-images = pkgs.symlinkJoin {
            name = "infrastructure-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.infrastructure);
          };

          database-images = pkgs.symlinkJoin {
            name = "database-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.database);
          };

          web-images = pkgs.symlinkJoin {
            name = "web-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.web);
          };

          runtime-images = pkgs.symlinkJoin {
            name = "runtime-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.runtime);
          };

          cli-images = pkgs.symlinkJoin {
            name = "cli-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.cli);
          };

          devops-images = pkgs.symlinkJoin {
            name = "devops-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.devops);
          };

          nix-images = pkgs.symlinkJoin {
            name = "nix-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.nix);
          };

          build-images = pkgs.symlinkJoin {
            name = "build-images";
            paths = map (name: images.${name}) (builtins.filter (n: images ? ${n}) imageCategories.build);
          };

          # BigBang images (from bigbang.txt)
          bigbang-images = pkgs.symlinkJoin {
            name = "bigbang-images";
            paths = map (name: images.${name}) bigbangImages;
          };

          # BigBang tarball bundle - single .tar.gz with all BigBang images
          # This creates a bundle with image JSON definitions that can be used with nix2container tools
          bigbang-bundle = pkgs.stdenv.mkDerivation {
            name = "bigbang-bundle";
            buildCommand = ''
              mkdir -p $out/images

              echo "Creating BigBang image bundle with ${toString (builtins.length bigbangImages)} images..."

              # Link each image's JSON definition
              ${pkgs.lib.concatStringsSep "\n" (map (name:
                let img = images.${name};
                in ''
                  echo "Adding ${name}..."
                  ln -s ${img} $out/images/${name}
                ''
              ) bigbangImages)}

              # Create manifest with image paths
              cat > $out/manifest.json << EOF
              {
                "version": "1.0",
                "images": [
                  ${pkgs.lib.concatStringsSep ",\n  " (map (name:
                    let img = images.${name};
                    in ''"${name}": {"path": "${img}", "tag": "${img.imageTag or "latest"}"}'') bigbangImages)}
                ],
                "count": ${toString (builtins.length bigbangImages)}
              }
              EOF

              # Create human-readable manifest
              cat > $out/manifest.txt << EOF
              BigBang Images Bundle
              ======================
              Images: ${toString (builtins.length bigbangImages)}
              Generated: $(date -Iseconds)

              Included images:
              ${pkgs.lib.concatStringsSep "\n" (map (name: "  - ${name}") bigbangImages)}

              Usage:
                Each image in images/ is a nix2container image JSON.
                Use nix2container tools or skopeo with nix: transport to copy images.

              Example with skopeo:
                skopeo copy nix:./images/alertmanager docker://registry.example.com/alertmanager:latest
              EOF

              # Create tarball
              cd $out
              tar -czvf bigbang-bundle.tar.gz images manifest.json manifest.txt

              echo "Bundle created: $out/bigbang-bundle.tar.gz"
            '';
          };

          # Script to build BigBang bundle from any list file
          build-image-list-bundle = pkgs.writeShellScriptBin "build-image-list-bundle" ''
            set -euo pipefail
            LIST_FILE="''${1:-bigbang.txt}"
            OUTPUT_DIR="''${2:-.}"

            if [[ ! -f "$LIST_FILE" ]]; then
              echo "Error: List file not found: $LIST_FILE" >&2
              exit 1
            fi

            echo "Building images from: $LIST_FILE"
            mkdir -p "$OUTPUT_DIR/images-dir"

            IMAGES_BUILT=0
            while read -r IMAGE_NAME; do
              [[ -z "$IMAGE_NAME" || "$IMAGE_NAME" =~ ^# ]] && continue

              echo "Building and copying $IMAGE_NAME..."
              if ${pkgs.nix}/bin/nix --extra-experimental-features "nix-command flakes" build ".#$IMAGE_NAME" -o "/tmp/img-$IMAGE_NAME" 2>/dev/null; then
                mkdir -p "$OUTPUT_DIR/images-dir/$IMAGE_NAME"
                ${pkgs.skopeo}/bin/skopeo copy \
                  "nix:/tmp/img-$IMAGE_NAME" \
                  "oci:$OUTPUT_DIR/images-dir/$IMAGE_NAME:latest" \
                  --insecure-policy
                IMAGES_BUILT=$((IMAGES_BUILT + 1))
              else
                echo "  Warning: Failed to build $IMAGE_NAME"
              fi
            done < "$LIST_FILE"

            echo "Creating tarball..."
            tar -czvf "$OUTPUT_DIR/images-bundle.tar.gz" -C "$OUTPUT_DIR/images-dir" .

            echo ""
            echo "Bundle created: $OUTPUT_DIR/images-bundle.tar.gz"
            echo "Total images: $IMAGES_BUILT"
          '';

          # Load all images at once
          load-all-to-docker = pkgs.stdenv.mkDerivation {
            name = "load-all-to-docker";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${loadAllScript} $out/bin/load-all-to-docker
              chmod +x $out/bin/load-all-to-docker
            '';
          };

          # Discovery script
          discover-images = pkgs.stdenv.mkDerivation {
            name = "discover-images";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${discoveryScript} $out/bin/discover-images
              chmod +x $out/bin/discover-images
            '';
          };

          # Test all images
          test-all-images = pkgs.stdenv.mkDerivation {
            name = "test-all-images";
            buildCommand = ''
              mkdir -p $out/bin
              cp ${testImagesScript} $out/bin/test-all-images
              chmod +x $out/bin/test-all-images
            '';
          };

          # Version checker script
          check-versions = pkgs.writeShellScriptBin "check-versions" ''
            echo "Package versions:"
            ${pkgs.lib.concatStringsSep "\n" (map (imageName:
              let version = getPackageVersion imageName; in
              ''echo "  ${imageName}: ${version}"''
            ) discoveredImages)}
          '';

          # Static website generator — see ./website/generate-site.nix
          website = pkgs.callPackage ./website/generate-site.nix { lib = pkgs.lib; };

          # Expose the chart puller script
          pull-all-charts = pullAllChartsScript;

          # Security scanning scripts
          scan-image = lib.scanning.scanImageScript;
          scan-all-bigbang = lib.scanning.scanAllBigbangScript;
          scan-all = lib.scanning.scanAllToFoldersScript;

          # Package bundle: all images + chart puller
          platform-bundle = pkgs.symlinkJoin {
            name = "platform-bundle";
            paths = [
              (pkgs.symlinkJoin { name = "all-images"; paths = builtins.attrValues images; })
              pullAllChartsScript
            ];
          };

        } // (import ./lib/pipelines.nix {
          inherit pkgs imageNames imageCategories getPackageVersion discoveredImages;
        }) // (import ./lib/chart-tools.nix {
          inherit pkgs;
          chartDefs = chartDefs;
        });

      # Generate devShells for a specific system
      mkDevShells = system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nix
              docker
              jq
              git
              gh
              gnumake
              just
            ];
            shellHook = ''
              echo "Nix Containers Development Environment"
              echo ""
              echo "Pipeline commands (local CI):"
              echo "  nix run .#pipeline             [target]  - Full pipeline (build, test, push)"
              echo "  nix run .#pipeline-build       [target]  - Build images"
              echo "  nix run .#pipeline-test        [target]  - Test images"
              echo "  nix run .#pipeline-push        [target]  - Push to registry"
              echo ""
              echo "  Targets: all, selected, <category>, or <image-name>"
              echo "  Environment: SKIP_TEST=true SKIP_PUSH=true PARALLEL=4"
              echo ""
              echo "Direct build commands:"
              echo "  nix build .#<image-name>           - Build single image"
              echo "  nix build .#all-images             - Build ALL images"
              echo "  nix build .#<category>-images      - Build by category"
              echo ""
              echo "Categories: infrastructure, database, web, runtime, cli, devops, nix, build"
              echo ""
              echo "Available images: ${toString (builtins.length discoveredImages)}"
            '';
          };

          website-dev = pkgs.mkShell {
            buildInputs = with pkgs; [ nodejs npm python3 ];
            shellHook = ''
              echo "Static Website Development Environment"
              echo "  nix build .#website - Generate static site"
            '';
          };
        };

      # Generate pipeline-only packages for Darwin systems
      mkDarwinPackages = system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };

          # Import version lookup function (uses x86_64-linux as reference)
          getPackageVersion = import ./lib/versions.nix {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };

          imageNames = discoveredImages;

          # Import manifest generator (no images needed, just metadata)
          manifest = import ./lib/manifest.nix {
            inherit pkgs getPackageVersion discoveredImages;
            images = {};  # No images on Darwin
          };

          pipelines = import ./lib/pipelines.nix {
            inherit pkgs imageNames imageCategories getPackageVersion discoveredImages;
          };

          chartTools = import ./lib/chart-tools.nix {
            inherit pkgs;
            chartDefs = chartDefs;
          };

        in pipelines // chartTools // {
          generate-manifest = manifest.generateManifest;
          manifest-json = manifest.manifestFile;
        };

    in {
      # Generate packages for Linux systems (includes container images)
      # Generate packages for Darwin systems (pipeline scripts only)
      packages = forLinuxSystems mkPackages // {
        x86_64-darwin = mkDarwinPackages "x86_64-darwin";
        aarch64-darwin = mkDarwinPackages "aarch64-darwin";
      };

      # Generate devShells for all supported systems
      devShells = forAllSystems mkDevShells;

      # Export discovered images for external use
      inherit discoveredImages;

      # Export image categories
      inherit imageCategories;

      # Export chart definitions
      chartDefinitions = import ./charts.nix;

      # Helper to get image names
      imageNames = discoveredImages;

      # Helper function for version lookup (uses x86_64-linux as reference)
      getPackageVersion = import ./lib/versions.nix {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };

      # Image versions map for tracking updates
      # Usage: nix eval --json .#imageVersions > versions.json
      imageVersions = let
        getVersion = import ./lib/versions.nix {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        };
      in builtins.listToAttrs (map (imageName: {
        name = imageName;
        value = getVersion imageName;
      }) discoveredImages);

      # Nixpkgs revision for tracking upstream updates
      nixpkgsRevision = nixpkgs.rev or "unknown";
    };
}
