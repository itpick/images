{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dotnet-8-targeting-pack
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dotnet-8-targeting-pack";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dotnet-8-targeting-pack";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dotnet-8-targeting-pack";
    homepage = "https://github.com/TODO/dotnet-8-targeting-pack";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
