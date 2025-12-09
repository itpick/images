{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dnsdist-2.0-nodnscrypt
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dnsdist-2.0-nodnscrypt";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dnsdist-2.0-nodnscrypt";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dnsdist-2.0-nodnscrypt";
    homepage = "https://github.com/TODO/dnsdist-2.0-nodnscrypt";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
