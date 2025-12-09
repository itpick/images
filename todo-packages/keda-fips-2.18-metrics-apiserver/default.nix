{ lib, stdenv, fetchFromGitHub, ... }:

# Package: keda-fips-2.18-metrics-apiserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "keda-fips-2.18-metrics-apiserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "keda-fips-2.18-metrics-apiserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for keda-fips-2.18-metrics-apiserver";
    homepage = "https://github.com/TODO/keda-fips-2.18-metrics-apiserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
