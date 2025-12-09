{ lib, stdenv, fetchFromGitHub, ... }:

# Package: krb5-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "krb5-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "krb5-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for krb5-dev";
    homepage = "https://github.com/TODO/krb5-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
