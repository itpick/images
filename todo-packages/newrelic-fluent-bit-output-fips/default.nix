{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-fluent-bit-output-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-fluent-bit-output-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-fluent-bit-output-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-fluent-bit-output-fips";
    homepage = "https://github.com/TODO/newrelic-fluent-bit-output-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
