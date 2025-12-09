{ lib, stdenv, fetchFromGitHub, ... }:

# Package: busybox-full
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "busybox-full";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "busybox-full";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for busybox-full";
    homepage = "https://github.com/TODO/busybox-full";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
