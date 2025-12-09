{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rpm2cpio
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rpm2cpio";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rpm2cpio";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rpm2cpio";
    homepage = "https://github.com/TODO/rpm2cpio";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
