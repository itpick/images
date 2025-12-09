{ lib, stdenv, fetchFromGitHub, ... }:

# Package: local-path-provisioner-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "local-path-provisioner-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "local-path-provisioner-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for local-path-provisioner-fips";
    homepage = "https://github.com/TODO/local-path-provisioner-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
