{ pkgs, lib, ... }:

# TODO: Add tests for fluent-bit-watcher-fips image
{
  name = "fluent-bit-watcher-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-bit-watcher-fips"
    exit 1
  '';
}
