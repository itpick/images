{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pcre2-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pcre2-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pcre2-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pcre2-dev";
    homepage = "https://github.com/TODO/pcre2-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
