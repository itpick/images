{ pkgs, lib, ... }:

# TODO: Add tests for psqlodbc-fips image
{
  name = "psqlodbc-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for psqlodbc-fips"
    exit 1
  '';
}
