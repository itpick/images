{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dapr-sentry-fips-1.15
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dapr-sentry-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dapr-sentry-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dapr-sentry-fips";
    homepage = "https://github.com/TODO/dapr-sentry-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
