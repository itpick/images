{ lib, stdenv, fetchFromGitHub, ... }:

# Package: newrelic-k8s-metadata-injection-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "newrelic-k8s-metadata-injection-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "newrelic-k8s-metadata-injection-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for newrelic-k8s-metadata-injection-fips";
    homepage = "https://github.com/TODO/newrelic-k8s-metadata-injection-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
