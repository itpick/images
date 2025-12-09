{ pkgs, lib, ... }:

# TODO: Add tests for dapr-scheduler-fips image
{
  name = "dapr-scheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dapr-scheduler-fips"
    exit 1
  '';
}
