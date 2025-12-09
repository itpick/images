{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libpcre2-16-0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libpcre2-16";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libpcre2-16";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libpcre2-16";
    homepage = "https://github.com/TODO/libpcre2-16";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
