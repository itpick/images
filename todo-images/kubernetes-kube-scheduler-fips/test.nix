{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-scheduler-fips image
{
  name = "kubernetes-kube-scheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-scheduler-fips"
    exit 1
  '';
}
