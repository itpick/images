{ pkgs, lib, ... }:

# TODO: Add tests for sqlite3 image
{
  name = "sqlite3";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sqlite3"
    exit 1
  '';
}
