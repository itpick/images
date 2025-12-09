{ lib, stdenv, fetchFromGitHub, ... }:

# Package: octo-sts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "octo-sts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "octo-sts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for octo-sts";
    homepage = "https://github.com/TODO/octo-sts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
