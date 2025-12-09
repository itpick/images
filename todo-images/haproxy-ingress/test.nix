{ pkgs, lib, ... }:

# TODO: Add tests for haproxy-ingress image
{
  name = "haproxy-ingress";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for haproxy-ingress"
    exit 1
  '';
}
