{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-ipafont-gothic
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-ipafont-gothic";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-ipafont-gothic";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-ipafont-gothic";
    homepage = "https://github.com/TODO/font-ipafont-gothic";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
