{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wso2is
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wso2is";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wso2is";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wso2is";
    homepage = "https://github.com/TODO/wso2is";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
