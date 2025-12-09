{ lib, stdenv, fetchFromGitHub, ... }:

# Package: velero-restore-helper
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "velero-restore-helper";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "velero-restore-helper";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for velero-restore-helper";
    homepage = "https://github.com/TODO/velero-restore-helper";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
