{ pkgs, lib, ... }:

# TODO: Add tests for duckdb image
{
  name = "duckdb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for duckdb"
    exit 1
  '';
}
