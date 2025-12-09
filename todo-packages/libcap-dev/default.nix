{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcap-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcap-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcap-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcap-dev";
    homepage = "https://github.com/TODO/libcap-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
