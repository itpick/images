{ lib, stdenv, fetchFromGitHub, ... }:

# Package: certificate-transparency-trillian-ctserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "certificate-transparency-trillian-ctserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "certificate-transparency-trillian-ctserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for certificate-transparency-trillian-ctserver";
    homepage = "https://github.com/TODO/certificate-transparency-trillian-ctserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
