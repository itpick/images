{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-pages-fips image
{
  name = "gitlab-pages-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-pages-fips"
    exit 1
  '';
}
