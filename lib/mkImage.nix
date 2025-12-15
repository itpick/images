# mkImage - Simple image builder for single-derivation container images
{ nix2container, busybox, lib, base, pkgs, ... }:

{ drv
, name ? drv.name or drv.pname or "image"
, tag ? "latest"
, entrypoint ? null
, cmd ? null
, env ? {}
, labels ? {}
, user ? "65534:65534"  # nobody by default
, extraContents ? []
, extraPkgs ? []  # Additional packages from SBOM (alias for extraContents)
, noBusybox ? false  # Skip busybox when packages conflict (e.g., iproute2)
, buildType ? "source"  # "source" = built from source, "binary" = pre-built binary
, ...
}@args:

let
  # Auto-detect binary name if entrypoint not specified
  binName = drv.pname or (builtins.parseDrvName drv.name).name;

  # Convert env attrset to list format
  envList = lib.mapAttrsToList (k: v: "${k}=${toString v}") env;

  # Path environment (application-specific)
  pathEnv = if noBusybox then [ "PATH=${drv}/bin" ] else [ "PATH=${busybox}/bin:${drv}/bin" ];

  # Combine extraContents and extraPkgs
  allExtraContents = extraContents ++ extraPkgs;

  # Base packages for system layer (optionally exclude busybox)
  baseLayerPkgs = (if noBusybox then [] else [ busybox ]) ++ base.basePackages ++ allExtraContents;

  # Create /tmp directory
  tmpDir = pkgs.runCommand "tmp-dir" {} ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage ({
  inherit name tag;

  # Multi-layer setup
  layers = [
    # Base system layer
    (nix2container.buildLayer {
      copyToRoot = baseLayerPkgs ++ [ tmpDir ];
      perms = [
        {
          path = tmpDir;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
    
    # Application layer
    (nix2container.buildLayer {
      copyToRoot = [ drv ];
      perms = [
        {
          path = drv;
          regex = ".*";
          mode = "0555";
        }
      ];
    })
  ];

  # Build type labels
  buildTypeLabels = {
    "io.nix-containers.build-type" = buildType;
    "io.nix-containers.build-method" = if buildType == "source" then "Built from source using Nix" else "Pre-built binary packaged with Nix";
  };

  config = {
    Entrypoint = if entrypoint != null then entrypoint else [ "${drv}/bin/${binName}" ];
    User = user;
    Env = base.defaultEnv ++ pathEnv ++ envList;
    Labels = base.defaultLabels // buildTypeLabels // labels;
  } // lib.optionalAttrs (cmd != null) {
    Cmd = cmd;
  };
} // (builtins.removeAttrs args [ "drv" "entrypoint" "cmd" "env" "labels" "user" "extraContents" "extraPkgs" "noBusybox" "buildType" ]))