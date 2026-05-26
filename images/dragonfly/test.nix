{ pkgs, image }:

pkgs.writeShellScript "test-dragonfly" ''
  set -euo pipefail
  
  echo "🧪 Testing dragonfly image functionality..."
  
  # Test 1: Dragonfly version reports itself
  echo "  ✓ Testing dragonfly version..."
  docker run --rm ${image.imageName}:test --version | grep -qiE "dragonfly|df-"
  
  # Test 2: Dragonfly help works and prints flag/option/usage text
  echo "  ✓ Testing dragonfly help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qiE "usage|flag|option"
  
  echo "✅ All dragonfly tests passed!"
''
