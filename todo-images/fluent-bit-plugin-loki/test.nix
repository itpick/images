{ pkgs, lib, ... }:

# TODO: Add tests for fluent-bit-plugin-loki image
{
  name = "fluent-bit-plugin-loki";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-bit-plugin-loki"
    exit 1
  '';
}
