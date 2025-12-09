{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kserve-router
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kserve-router";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kserve-router";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kserve-router";
    homepage = "https://github.com/TODO/kserve-router";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
