{ pkgs, lib, ... }:

# TODO: Add tests for trino image
{
  name = "trino";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trino"
    exit 1
  '';
}
