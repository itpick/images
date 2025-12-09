{ lib, stdenv, fetchFromGitHub, ... }:

# Package: regclient-regctl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "regclient-regctl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "regclient-regctl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for regclient-regctl";
    homepage = "https://github.com/TODO/regclient-regctl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
