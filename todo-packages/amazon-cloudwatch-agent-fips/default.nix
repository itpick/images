{ lib, stdenv, fetchFromGitHub, ... }:

# Package: amazon-cloudwatch-agent-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "amazon-cloudwatch-agent-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "amazon-cloudwatch-agent-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for amazon-cloudwatch-agent-fips";
    homepage = "https://github.com/TODO/amazon-cloudwatch-agent-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
