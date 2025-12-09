{ lib, stdenv, fetchFromGitHub, ... }:

# Package: harbor-registry-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "harbor-registry-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "harbor-registry-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for harbor-registry-fips";
    homepage = "https://github.com/TODO/harbor-registry-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
