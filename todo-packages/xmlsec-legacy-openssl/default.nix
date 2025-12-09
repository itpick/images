{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xmlsec-legacy-openssl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xmlsec-legacy-openssl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xmlsec-legacy-openssl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xmlsec-legacy-openssl";
    homepage = "https://github.com/TODO/xmlsec-legacy-openssl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
