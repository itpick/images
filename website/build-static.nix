{ pkgs }:

let
  # Simple static site builder
  imagesPath = ../images;
  imageNames = builtins.attrNames (builtins.readDir imagesPath);
  validImages = builtins.filter (name: 
    builtins.pathExists (imagesPath + "/${name}/default.nix")
  ) imageNames;

  # Generate basic image data
  generateImageInfo = imageName: {
    name = imageName;
    hasReadme = builtins.pathExists (imagesPath + "/${imageName}/README.md");
    hasTest = builtins.pathExists (imagesPath + "/${imageName}/test.nix");
    pullCommand = "docker pull ghcr.io/nix-containers/images/${imageName}:latest";
  };

  imagesData = map generateImageInfo validImages;
  imagesJson = builtins.toJSON {
    images = imagesData;
    totalCount = builtins.length imagesData;
    lastUpdated = "BUILD_TIME";
  };

in pkgs.stdenv.mkDerivation {
  name = "nix-containers-website";
  
  buildPhase = ''
    mkdir -p $out
    
    # Copy static files
    ${if builtins.pathExists ./static then "cp -r ${./static}/* $out/" else ""}
    
    # Generate images data JSON
    cat > $out/images-data.json << 'EOF'
    ${imagesJson}
    EOF
    
    # Replace BUILD_TIME with actual timestamp
    ${pkgs.gnused}/bin/sed -i "s/BUILD_TIME/$(date -Iseconds)/g" $out/images-data.json
    
    # Copy README files for each image
    mkdir -p $out/readmes
    ${pkgs.lib.concatStringsSep "\n" (map (imageName: ''
      if [ -f "${imagesPath}/${imageName}/README.md" ]; then
        cp "${imagesPath}/${imageName}/README.md" $out/readmes/${imageName}.md
      fi
    '') validImages)}
  '';
  
  installPhase = ''
    echo "Static website built successfully"
    echo "Total images: ${toString (builtins.length imagesData)}"
    ls -la $out/
  '';
}