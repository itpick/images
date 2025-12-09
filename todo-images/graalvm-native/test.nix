{ pkgs, lib, ... }:

# TODO: Add tests for graalvm-native image
{
  name = "graalvm-native";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for graalvm-native"
    exit 1
  '';
}
