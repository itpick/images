{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-kubernetes-operator-version-upgrade-post-start-hook-fips image
{
  name = "mongodb-kubernetes-operator-version-upgrade-post-start-hook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-kubernetes-operator-version-upgrade-post-start-hook-fips"
    exit 1
  '';
}
