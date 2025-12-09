# mkImage - Simple image builder for single-derivation container images
{ nix2container, busybox, lib, base, ... }:

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
, ...
}@args:

let
  # Auto-detect binary name if entrypoint not specified
  binName = drv.pname or (builtins.parseDrvName drv.name).name;

  # Convert env attrset to list format
  envList = lib.mapAttrsToList (k: v: "${k}=${toString v}") env;

  # Path environment (application-specific)
  pathEnv = [ "PATH=${busybox}/bin:${drv}/bin" ];

  # Combine extraContents and extraPkgs
  allExtraContents = extraContents ++ extraPkgs;

in
nix2container.buildImage ({
  inherit name tag;

  # Multi-layer setup
  layers = [
    # Base system layer
    (nix2container.buildLayer {
      copyToRoot = [ busybox ] ++ base.basePackages ++ allExtraContents;
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

  config = {
    Entrypoint = if entrypoint != null then entrypoint else [ "${drv}/bin/${binName}" ];
    User = user;
    Env = base.defaultEnv ++ pathEnv ++ envList;
    Labels = base.defaultLabels // labels;
  } // lib.optionalAttrs (cmd != null) {
    Cmd = cmd;
  };
} // (builtins.removeAttrs args [ "drv" "entrypoint" "cmd" "env" "labels" "user" "extraContents" "extraPkgs" ]))