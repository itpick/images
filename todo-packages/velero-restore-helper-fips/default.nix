{ lib, stdenv, fetchFromGitHub, ... }:

# Package: velero-restore-helper-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "velero-restore-helper-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "velero-restore-helper-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for velero-restore-helper-fips";
    homepage = "https://github.com/TODO/velero-restore-helper-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
