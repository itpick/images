{ pkgs, lib }:

let
  # Get all image directories
  imagesPath = ../images;
  allFiles = lib.filesystem.listFilesRecursive imagesPath;
  imageFiles = builtins.filter (path: 
    let
      pathStr = toString path;
      relativePath = lib.removePrefix (toString imagesPath + "/") pathStr;
      parts = lib.splitString "/" relativePath;
    in
      builtins.length parts == 2 && 
      builtins.elemAt parts 1 == "default.nix" &&
      !(builtins.any (part: part == "fake_nixpkgs" || part == "root" || part == "patches") parts)
  ) allFiles;
  
  imageNames = lib.lists.unique (map (path:
    let
      pathStr = toString path;
      relativePath = lib.removePrefix (toString imagesPath + "/") pathStr;
      parts = lib.splitString "/" relativePath;
    in
      builtins.elemAt parts 0
  ) imageFiles);

  # Generate image metadata
  generateImageData = imageName:
    let
      readmePath = imagesPath + "/${imageName}/README.md";
      nixPath = imagesPath + "/${imageName}/default.nix";
      testPath = imagesPath + "/${imageName}/test.nix";
      
      readmeContent = if builtins.pathExists readmePath 
        then builtins.readFile readmePath 
        else "# ${imageName}\n\nNo README available.";
        
      nixContent = if builtins.pathExists nixPath
        then builtins.readFile nixPath
        else "";
        
      hasTest = builtins.pathExists testPath;
      
      # Extract metadata from Nix file
      extractLabel = label: default:
        let
          pattern = "\"${label}\"\\s*=\\s*\"([^\"]+)\"";
          match = builtins.match ".*${pattern}.*" nixContent;
        in if match != null then builtins.head match else default;
      
      # Extract version - handle both static strings and package references
      extractVersion = 
        let
          staticMatch = builtins.match ".*\"org\\.opencontainers\\.image\\.version\"\\s*=\\s*\"([^\"]+)\".*" nixContent;
          dynamicMatch = builtins.match ".*\"org\\.opencontainers\\.image\\.version\"\\s*=\\s*pkgs\\.([^;]+)\\.version.*" nixContent;
        in
          if staticMatch != null then builtins.head staticMatch
          else if dynamicMatch != null then "dynamic-${builtins.head dynamicMatch}"
          else "latest";
    in {
      name = imageName;
      description = extractLabel "org\\.opencontainers\\.image\\.description" "Container image for ${imageName}";
      version = extractVersion;
      category = extractLabel "io\\.nix-containers\\.image\\.category" "utility";
      upstream = extractLabel "io\\.nix-containers\\.image\\.upstream" "";
      aliases = extractLabel "io\\.nix-containers\\.image\\.aliases" imageName;
      hasTest = hasTest;
      readme = readmeContent;
      pullCommand = "docker pull ghcr.io/nix-containers/images/${imageName}:latest";
      nixCode = nixContent;
    };

  # Generate all image data
  imagesData = map generateImageData imageNames;
  
  # Convert to JSON
  imagesJson = builtins.toJSON {
    images = imagesData;
    lastUpdated = "BUILD_TIME_PLACEHOLDER";
    totalCount = builtins.length imagesData;
  };

in pkgs.stdenv.mkDerivation {
  name = "nix-containers-website";
  
  src = ./.;
  
  buildInputs = with pkgs; [ jq ];
  
  buildPhase = ''
    # Copy static assets
    mkdir -p $out
    cp -r public/* $out/ 2>/dev/null || true
    cp index.html $out/ 2>/dev/null || true
    
    # Generate images data
    echo '${imagesJson}' | jq '.' > $out/images-data.json
    
    # Replace BUILD_TIME_PLACEHOLDER with actual build time
    BUILD_TIME=$(date -Iseconds)
    sed -i "s/BUILD_TIME_PLACEHOLDER/$BUILD_TIME/g" $out/images-data.json
    
    # Copy website files
    cp ${./static}/* $out/ 2>/dev/null || true
  '';
  
  installPhase = ''
    echo "Static website generated at $out"
    echo "Images data available at $out/images-data.json"
    echo "Total images: ${toString (builtins.length imagesData)}"
  '';
}