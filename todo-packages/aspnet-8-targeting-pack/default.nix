{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aspnet-8-targeting-pack
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aspnet-8-targeting-pack";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aspnet-8-targeting-pack";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aspnet-8-targeting-pack";
    homepage = "https://github.com/TODO/aspnet-8-targeting-pack";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
