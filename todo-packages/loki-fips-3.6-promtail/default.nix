{ lib, stdenv, fetchFromGitHub, ... }:

# Package: loki-fips-3.6-promtail
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "loki-fips-3.6-promtail";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "loki-fips-3.6-promtail";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for loki-fips-3.6-promtail";
    homepage = "https://github.com/TODO/loki-fips-3.6-promtail";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
