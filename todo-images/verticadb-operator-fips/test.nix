{ pkgs, lib, ... }:

# TODO: Add tests for verticadb-operator-fips image
{
  name = "verticadb-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for verticadb-operator-fips"
    exit 1
  '';
}
