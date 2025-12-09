{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argo-workflows-known-hosts-fips-3.7
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argo-workflows-known-hosts-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argo-workflows-known-hosts-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argo-workflows-known-hosts-fips";
    homepage = "https://github.com/TODO/argo-workflows-known-hosts-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
