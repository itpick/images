{ lib, stdenv, fetchFromGitHub, ... }:

# Package: yace-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "yace-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "yace-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for yace-fips";
    homepage = "https://github.com/TODO/yace-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
