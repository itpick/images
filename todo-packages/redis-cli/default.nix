{ lib, stdenv, fetchFromGitHub, ... }:

# Package: redis-cli-7.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "redis-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "redis-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for redis-cli";
    homepage = "https://github.com/TODO/redis-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
