{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gettext-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gettext-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gettext-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gettext-dev";
    homepage = "https://github.com/TODO/gettext-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
