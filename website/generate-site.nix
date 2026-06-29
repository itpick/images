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
    in {
      name = imageName;
      description = extractLabel nixContent "org\\.opencontainers\\.image\\.description"
                       "Container image for ${imageName}";
      version = version;
      category = extractLabel nixContent "io\\.nix-containers\\.image\\.category" "utility";
      upstream = extractLabel nixContent "io\\.nix-containers\\.image\\.upstream" "";
      aliases = extractLabel nixContent "io\\.nix-containers\\.image\\.aliases" imageName;
      hasTest = builtins.pathExists testPath;
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
    cp static/app.js $OUT_DIR/static/app.js

    echo "-> Rendering pages..."
    SCAN_ARG=""
    if [ -n "''${SCAN_DATA_PATH:-}" ] && [ -d "$SCAN_DATA_PATH" ]; then
      echo "   Using SCAN_DATA_PATH=$SCAN_DATA_PATH"
      SCAN_ARG="--scan-data $SCAN_DATA_PATH"
    else
      echo "   No scan data; vulnerability panels will be omitted"
    fi
    BASE_ARG="--base-path /"
    if [ -n "''${PAGES_BASE_PATH:-}" ]; then
      echo "   Using PAGES_BASE_PATH=$PAGES_BASE_PATH"
      BASE_ARG="--base-path $PAGES_BASE_PATH"
    fi
    python3 render.py \
      --data ${imagesJsonFull} \
      --templates ./templates \
      --out $OUT_DIR \
      --cmark ${pkgs.cmark}/bin/cmark \
      --pygmentize ${pkgs.python3Packages.pygments}/bin/pygmentize \
      $BASE_ARG \
      $SCAN_ARG

    echo "-> Build complete. Output:"
    ls -la $OUT_DIR/
    echo "Image pages: $(ls $OUT_DIR/images/ | wc -l)"

    runHook postBuild
  '';

  dontInstall = true;
}
