{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nova-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nova-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nova-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nova-fips";
    homepage = "https://github.com/TODO/nova-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
