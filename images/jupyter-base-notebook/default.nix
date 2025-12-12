{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Jupyter Base Notebook
# A minimal Jupyter notebook server with common data science packages
# https://jupyter.org/

let
  python = pkgs.python312;
  ps = python.pkgs;

  # Define packages with their metadata for SBOM
  pythonPackageList = [
    # Jupyter core
    ps.jupyter
    ps.jupyterlab
    ps.notebook
    ps.ipykernel
    ps.ipywidgets

    # Data science essentials
    ps.numpy
    ps.pandas
    ps.matplotlib
    ps.scipy

    # Utilities
    ps.requests
    ps.pyyaml
  ];

  # Create Python environment
  pythonEnv = python.withPackages (_: pythonPackageList);

  # Generate SBOM metadata for labels
  # Format: "name:version:hash" for each package
  mkPkgInfo = pkg:
    let
      name = pkg.pname or pkg.name or "unknown";
      version = pkg.version or "unknown";
      # Get the output hash (store path hash)
      hash = builtins.substring 11 32 (builtins.baseNameOf pkg.outPath);
    in "${name}:${version}:${hash}";

  sbomPackages = builtins.concatStringsSep "," (map mkPkgInfo pythonPackageList);

  # Additional system packages
  systemPkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
    git  # For cloning notebooks
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "jupyter-base-notebook";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "jupyter-base-notebook-root";
      paths = base.basePackages ++ [ pythonEnv ] ++ systemPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Entrypoint = [ "${pythonEnv}/bin/jupyter" ];
    Cmd = [ "lab" "--ip=0.0.0.0" "--port=8888" "--no-browser" ];
    ExposedPorts = {
      "8888/tcp" = {};
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath ([ pythonEnv ] ++ systemPkgs)}"
      "JUPYTER_PORT=8888"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "Jupyter Base Notebook";
      "org.opencontainers.image.description" = "Minimal Jupyter notebook with data science packages";
      "org.opencontainers.image.version" = "latest";
      "io.nix-containers.image.upstream" = "https://jupyter.org/";
      # SBOM metadata - Python packages included in this image
      # Format: name:version:nix-store-hash
      "io.nix-containers.sbom.python" = sbomPackages;
      "io.nix-containers.sbom.python-version" = python.version;
    };
  };
}
