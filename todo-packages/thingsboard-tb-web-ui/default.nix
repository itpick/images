{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thingsboard-tb-web-ui
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thingsboard-tb-web-ui";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thingsboard-tb-web-ui";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thingsboard-tb-web-ui";
    homepage = "https://github.com/TODO/thingsboard-tb-web-ui";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
