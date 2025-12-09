{ lib, stdenv, fetchFromGitHub, ... }:

# Package: userspace-rcu
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "userspace-rcu";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "userspace-rcu";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for userspace-rcu";
    homepage = "https://github.com/TODO/userspace-rcu";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
