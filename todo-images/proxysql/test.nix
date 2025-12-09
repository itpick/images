{ pkgs, lib, ... }:

# TODO: Add tests for proxysql image
{
  name = "proxysql";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for proxysql"
    exit 1
  '';
}
