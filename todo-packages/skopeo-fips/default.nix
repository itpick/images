{ lib, stdenv, fetchFromGitHub, ... }:

# Package: skopeo-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "skopeo-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "skopeo-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for skopeo-fips";
    homepage = "https://github.com/TODO/skopeo-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
