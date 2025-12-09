{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thingsboard-tb-js-executor
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thingsboard-tb-js-executor";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thingsboard-tb-js-executor";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thingsboard-tb-js-executor";
    homepage = "https://github.com/TODO/thingsboard-tb-js-executor";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
