{ lib, stdenv, fetchFromGitHub, ... }:

# Package: datadog-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "datadog-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "datadog-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for datadog-operator-fips";
    homepage = "https://github.com/TODO/datadog-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
