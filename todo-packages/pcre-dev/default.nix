{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pcre-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pcre-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pcre-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pcre-dev";
    homepage = "https://github.com/TODO/pcre-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
