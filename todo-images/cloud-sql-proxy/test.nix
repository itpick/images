{ pkgs, lib, ... }:

# TODO: Add tests for cloud-sql-proxy image
{
  name = "cloud-sql-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-sql-proxy"
    exit 1
  '';
}
