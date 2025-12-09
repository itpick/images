{ pkgs, lib, ... }:

# TODO: Add tests for code-server-fips image
{
  name = "code-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for code-server-fips"
    exit 1
  '';
}
