{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-operator-fips";
    homepage = "https://github.com/TODO/fluent-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
