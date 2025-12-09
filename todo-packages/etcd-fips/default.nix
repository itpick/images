{ lib, stdenv, fetchFromGitHub, ... }:

# Package: etcd-fips-3.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "etcd-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "etcd-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for etcd-fips";
    homepage = "https://github.com/TODO/etcd-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
