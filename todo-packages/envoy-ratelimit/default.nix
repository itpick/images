{ lib, stdenv, fetchFromGitHub, ... }:

# Package: envoy-ratelimit
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "envoy-ratelimit";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "envoy-ratelimit";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for envoy-ratelimit";
    homepage = "https://github.com/TODO/envoy-ratelimit";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
