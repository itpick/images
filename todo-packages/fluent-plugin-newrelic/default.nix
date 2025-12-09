{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluent-plugin-newrelic
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluent-plugin-newrelic";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluent-plugin-newrelic";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluent-plugin-newrelic";
    homepage = "https://github.com/TODO/fluent-plugin-newrelic";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
