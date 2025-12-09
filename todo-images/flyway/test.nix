{ pkgs, lib, ... }:

# TODO: Add tests for flyway image
{
  name = "flyway";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flyway"
    exit 1
  '';
}
