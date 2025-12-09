{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opentofu-fips-1.10
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opentofu-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opentofu-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opentofu-fips";
    homepage = "https://github.com/TODO/opentofu-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
