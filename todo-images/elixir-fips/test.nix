{ pkgs, lib, ... }:

# TODO: Add tests for elixir-fips image
{
  name = "elixir-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elixir-fips"
    exit 1
  '';
}
