{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcom_err
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcom_err";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcom_err";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcom_err";
    homepage = "https://github.com/TODO/libcom_err";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
