{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcap-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcap-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcap-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcap-utils";
    homepage = "https://github.com/TODO/libcap-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
