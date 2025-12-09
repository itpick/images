{ pkgs, lib, ... }:

# TODO: Add tests for psqlodbc image
{
  name = "psqlodbc";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for psqlodbc"
    exit 1
  '';
}
