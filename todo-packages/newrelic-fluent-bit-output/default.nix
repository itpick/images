{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-fluent-bit-output
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-fluent-bit-output";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-fluent-bit-output";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-fluent-bit-output";
    homepage = "https://github.com/TODO/newrelic-fluent-bit-output";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
