{ lib, stdenv, fetchFromGitHub, ... }:

# Package: harbor-fips-2.14
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "harbor-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "harbor-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for harbor-fips";
    homepage = "https://github.com/TODO/harbor-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
