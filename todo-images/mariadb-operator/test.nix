{ pkgs, lib, ... }:

# TODO: Add tests for mariadb-operator image
{
  name = "mariadb-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mariadb-operator"
    exit 1
  '';
}
