{ pkgs, lib }:

let
  imagesPath = ../images;
  allFiles = lib.filesystem.listFilesRecursive imagesPath;

  # A directory with a file-extension suffix (e.g. images/PACKAGE_SUMMARY.md/)
  # is invariably a generation-script artifact, not a real image. Reject so it
  # never resurfaces on the site. Legitimate image names with version dots
  # (e.g. argo-cd-3.2-repo-server, cilium-1.18-clustermesh-apiserver) do not
  # end in one of these extensions, so they pass through.
  stubExtensions = [ ".md" ".txt" ".json" ".log" ".yaml" ".yml" ".lock" ".html" ".sh" ];
  endsInStubExt = name: builtins.any (ext: lib.hasSuffix ext name) stubExtensions;

  imageFiles = builtins.filter (path:
    let
      pathStr = toString path;
      relativePath = lib.removePrefix (toString imagesPath + "/") pathStr;
      parts = lib.splitString "/" relativePath;
      dirname = builtins.elemAt parts 0;
    in
      builtins.length parts == 2 &&
      builtins.elemAt parts 1 == "default.nix" &&
      !(builtins.any (part: part == "fake_nixpkgs" || part == "root" || part == "patches") parts) &&
      !(endsInStubExt dirname)
  ) allFiles;

  imageNames = lib.lists.unique (map (path:
    let
      pathStr = toString path;
      relativePath = lib.removePrefix (toString imagesPath + "/") pathStr;
      parts = lib.splitString "/" relativePath;
    in
      builtins.elemAt parts 0
  ) imageFiles);

  # Reverse-lookup: nixImage -> [chart names]
  # Source of truth: ../chart-image-mapping.nix (attrset of tiers, each
  # tier is an attrset of entries with { nixImage, usedBy, ... } fields).
  chartMapping = import ../chart-image-mapping.nix;

  chartsPerImageRaw =
    lib.foldl' (acc: entry:
      acc // { ${entry.nixImage} =
        lib.unique ((acc.${entry.nixImage} or []) ++ entry.usedBy); }
    ) {} (lib.flatten (
      lib.mapAttrsToList (_tier: entries:
        lib.mapAttrsToList (_name: e: {
          inherit (e) nixImage usedBy;
        }) entries
      ) chartMapping
    ));

  chartsForImage = imageName: chartsPerImageRaw.${imageName} or [];

  # Curated nixpkgs metadata (meta.description / longDescription / homepage)
  # for images packaged directly from nixpkgs (drv = pkgs.<attr>). Generated
  # offline (scripts/gen-nixpkgs-meta) and committed as JSON, so the site
  # build stays pure — it never evaluates pkgs.<attr> (which can throw on
  # broken attrs like spire-agent). Keyed by image name.
  nixpkgsMeta =
    if builtins.pathExists ./nixpkgs-meta.json
    then builtins.fromJSON (builtins.readFile ./nixpkgs-meta.json)
    else {};
  nixMetaFor = imageName: nixpkgsMeta.${imageName} or {};

  extractLabel = nixContent: label: default:
    let
      pattern = "\"${label}\"[[:space:]]*=[[:space:]]*\"([^\"]+)\"";
      match = builtins.match ".*${pattern}.*" nixContent;
    in if match != null then builtins.head match else default;

  generateImageData = imageName:
    let
      readmePath = imagesPath + "/${imageName}/README.md";
      nixPath = imagesPath + "/${imageName}/default.nix";
      testPath = imagesPath + "/${imageName}/test.nix";

      readmeContent = if builtins.pathExists readmePath
        then builtins.readFile readmePath
        else "";

      nixContent = if builtins.pathExists nixPath
        then builtins.readFile nixPath
        else "";

      version =
        let
          staticMatch = builtins.match ".*\"org\\.opencontainers\\.image\\.version\"[[:space:]]*=[[:space:]]*\"([^\"]+)\".*" nixContent;
          dynamicMatch = builtins.match ".*\"org\\.opencontainers\\.image\\.version\"[[:space:]]*=[[:space:]]*pkgs\\.([^;]+)\\.version.*" nixContent;
        in
          if staticMatch != null then builtins.head staticMatch
          else if dynamicMatch != null then "dynamic-${builtins.head dynamicMatch}"
          else "latest";
      nixMeta = nixMetaFor imageName;
    in {
      name = imageName;
      description = extractLabel nixContent "org\\.opencontainers\\.image\\.description"
                       "Container image for ${imageName}";
      # Curated nixpkgs metadata (empty for non-nixpkgs images). render.py
      # uses these to build a richer "About" block on the Description tab.
      nixDescription = nixMeta.description or "";
      nixLongDescription = nixMeta.longDescription or "";
      nixHomepage = nixMeta.homepage or "";
      version = version;
      category = extractLabel nixContent "io\\.nix-containers\\.image\\.category" "utility";
      upstream = extractLabel nixContent "io\\.nix-containers\\.image\\.upstream" "";
      aliases = extractLabel nixContent "io\\.nix-containers\\.image\\.aliases" imageName;
      hasTest = builtins.pathExists testPath;
      # True when the image packages a tool directly from nixpkgs
      # (drv = pkgs.<attr>), as opposed to an upstream binary download
      # (drv = pkgs.stdenv.mkDerivation/fetchurl) or a from-source build
      # (drv = <let-bound buildGoModule/...>). Drives the "Nix" catalog badge.
      fromNixpkgs = (lib.hasInfix "drv = pkgs." nixContent)
        && !(lib.hasInfix "drv = pkgs.stdenv" nixContent)
        && !(lib.hasInfix "drv = pkgs.fetchurl" nixContent);
      readme = readmeContent;
      pullCommand = "docker pull ghcr.io/nix-containers/images/${imageName}:latest";
      nixCode = nixContent;
      usedByCharts = chartsForImage imageName;
    };

  imagesData = map generateImageData imageNames;

  imagesJsonFull = pkgs.writeText "images-data-full.json" (builtins.toJSON {
    images = imagesData;
    totalCount = builtins.length imagesData;
  });

in
pkgs.stdenv.mkDerivation {
  name = "nix-containers-website";
  src = ./.;

  buildInputs = [
    pkgs.tailwindcss
    pkgs.cmark
    pkgs.python3
    pkgs.python3Packages.pygments
  ];

  # When SCAN_DATA_PATH is set (e.g. by deploy-website.yml after
  # downloading the security-scan-results artifact), per-image pages
  # gain a vulnerability panel. When unset, build proceeds without.
  # Requires --impure to read the env var; CI passes that flag.
  SCAN_DATA_PATH = builtins.getEnv "SCAN_DATA_PATH";

  # URL base path for the deployed site. GitHub Pages project sites live
  # at /<repo>/, so CI sets PAGES_BASE_PATH=/images/. Local builds leave
  # it empty → render.py defaults to "/". Also requires --impure when set.
  PAGES_BASE_PATH = builtins.getEnv "PAGES_BASE_PATH";

  # ISO timestamp of the last successful build-containers.yml run on
  # main, populated by deploy-website.yml. Feeds render.py's freshness
  # check that gates the green dot on the index (the second of two
  # gates; the first is scan-within-7-days, per-image). Unset locally
  # → render.py treats build as recent so local builds don't render
  # everything as stale.
  LAST_BUILD_AT = builtins.getEnv "LAST_BUILD_AT";

  buildPhase = ''
    runHook preBuild

    export HOME=$TMPDIR
    OUT_DIR=$out
    mkdir -p $OUT_DIR

    echo "-> Compiling Tailwind CSS..."
    mkdir -p $OUT_DIR/static/css
    tailwindcss -c tailwind/tailwind.config.js \
      -i tailwind/input.css \
      -o $OUT_DIR/static/css/site.css \
      --minify

    echo "-> Copying static assets..."
    mkdir -p $OUT_DIR/static/fonts
    cp -r static/fonts/* $OUT_DIR/static/fonts/

    mkdir -p $OUT_DIR/static/favicon
    cp -r static/favicon/* $OUT_DIR/static/favicon/
    cp static/app.js $OUT_DIR/static/app.js
    cp static/packages.js $OUT_DIR/static/packages.js

    echo "-> Parsing image popularity table..."
    python3 parse-popularity.py \
      --in ${../IMAGE-POPULARITY.md} \
      --out $TMPDIR/popularity.json

    echo "-> Rendering pages..."
    SCAN_ARG=""
    # Prefer scan-data staged INSIDE the source tree (./scan-data) —
    # this is what deploy-website.yml uses, because it survives the
    # Nix sandbox. Fall back to the SCAN_DATA_PATH env var for legacy /
    # local-dev paths that point outside the sandbox.
    if [ -d ./scan-data ]; then
      echo "   Using in-tree scan-data/ ($(ls ./scan-data/*-trivy.json 2>/dev/null | wc -l) trivy files)"
      SCAN_ARG="--scan-data ./scan-data --sbom-data ./scan-data"
    elif [ -n "''${SCAN_DATA_PATH:-}" ] && [ -d "$SCAN_DATA_PATH" ]; then
      echo "   Using SCAN_DATA_PATH=$SCAN_DATA_PATH"
      SCAN_ARG="--scan-data $SCAN_DATA_PATH --sbom-data $SCAN_DATA_PATH"
    else
      echo "   No scan data; vulnerability + SBOM panels will be omitted"
    fi
    # Tags data is staged into the source tree by deploy-website.yml's
    # GHCR-API fetcher step. Optional: when absent (local builds), the
    # Tags tab renders a "not yet built" placeholder.
    TAGS_ARG=""
    if [ -d ./tags-data ]; then
      echo "   Using in-tree tags-data/ ($(ls ./tags-data/*.json 2>/dev/null | wc -l) tag files)"
      TAGS_ARG="--tags-data ./tags-data"
    else
      echo "   No tags data; Tags tab will show empty placeholder"
    fi
    BASE_ARG="--base-path /"
    if [ -n "''${PAGES_BASE_PATH:-}" ]; then
      echo "   Using PAGES_BASE_PATH=$PAGES_BASE_PATH"
      BASE_ARG="--base-path $PAGES_BASE_PATH"
    fi
    BUILD_ARG=""
    if [ -n "''${LAST_BUILD_AT:-}" ]; then
      echo "   Using LAST_BUILD_AT=$LAST_BUILD_AT"
      BUILD_ARG="--last-build $LAST_BUILD_AT"
    fi
    python3 render.py \
      --data ${imagesJsonFull} \
      --templates ./templates \
      --out $OUT_DIR \
      --cmark ${pkgs.cmark}/bin/cmark \
      --pygmentize ${pkgs.python3Packages.pygments}/bin/pygmentize \
      --popularity $TMPDIR/popularity.json \
      $BASE_ARG \
      $SCAN_ARG \
      $TAGS_ARG \
      $BUILD_ARG

    echo "-> Build complete. Output:"
    ls -la $OUT_DIR/
    echo "Image pages: $(ls $OUT_DIR/images/ | wc -l)"

    runHook postBuild
  '';

  dontInstall = true;
}
