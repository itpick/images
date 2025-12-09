{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thanos-receive-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thanos-receive-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thanos-receive-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thanos-receive-controller-fips";
    homepage = "https://github.com/TODO/thanos-receive-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
