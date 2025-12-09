{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dotnet-10-sdk
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dotnet-10-sdk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dotnet-10-sdk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dotnet-10-sdk";
    homepage = "https://github.com/TODO/dotnet-10-sdk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
