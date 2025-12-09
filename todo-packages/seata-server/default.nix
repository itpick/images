{ lib, stdenv, fetchFromGitHub, ... }:

# Package: seata-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "seata-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "seata-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for seata-server";
    homepage = "https://github.com/TODO/seata-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
