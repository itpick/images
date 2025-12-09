{ lib, stdenv, fetchFromGitHub, ... }:

# Package: velero-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "velero-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "velero-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for velero-fips";
    homepage = "https://github.com/TODO/velero-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
