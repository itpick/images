{ lib, stdenv, fetchFromGitHub, ... }:

# Package: erl28-elixir-1.19
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "erl28-elixir";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "erl28-elixir";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for erl28-elixir";
    homepage = "https://github.com/TODO/erl28-elixir";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
