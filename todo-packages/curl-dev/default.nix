{ lib, stdenv, fetchFromGitHub, ... }:

# Package: curl-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "curl-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "curl-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for curl-dev";
    homepage = "https://github.com/TODO/curl-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
