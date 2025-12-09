{ lib, stdenv, fetchFromGitHub, ... }:

# Package: statsd-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "statsd-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "statsd-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for statsd-fips";
    homepage = "https://github.com/TODO/statsd-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
