{ pkgs, lib, ... }:

# TODO: Add tests for erlang-fips image
{
  name = "erlang-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for erlang-fips"
    exit 1
  '';
}
