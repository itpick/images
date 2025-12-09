{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcurl-openssl4
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcurl-openssl4";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcurl-openssl4";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcurl-openssl4";
    homepage = "https://github.com/TODO/libcurl-openssl4";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
