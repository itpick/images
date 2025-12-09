{ lib, stdenv, fetchFromGitHub, ... }:

# Package: efs-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "efs-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "efs-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for efs-utils";
    homepage = "https://github.com/TODO/efs-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
