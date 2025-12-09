{ pkgs, lib, ... }:

# TODO: Add tests for trufflehog-fips image
{
  name = "trufflehog-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trufflehog-fips"
    exit 1
  '';
}
