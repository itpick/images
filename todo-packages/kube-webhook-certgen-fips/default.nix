{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-webhook-certgen-fips-1.14
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-webhook-certgen-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-webhook-certgen-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-webhook-certgen-fips";
    homepage = "https://github.com/TODO/kube-webhook-certgen-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
