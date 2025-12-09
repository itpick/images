{ lib, stdenv, fetchFromGitHub, ... }:

# Package: netstandard-9-targeting-pack
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "netstandard-9-targeting-pack";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "netstandard-9-targeting-pack";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for netstandard-9-targeting-pack";
    homepage = "https://github.com/TODO/netstandard-9-targeting-pack";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
