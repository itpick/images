{ lib, stdenv, fetchFromGitHub, ... }:

# Package: opencost
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "opencost";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "opencost";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for opencost";
    homepage = "https://github.com/TODO/opencost";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
