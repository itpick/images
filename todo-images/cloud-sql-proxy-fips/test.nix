{ pkgs, lib, ... }:

# TODO: Add tests for cloud-sql-proxy-fips image
{
  name = "cloud-sql-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-sql-proxy-fips"
    exit 1
  '';
}
