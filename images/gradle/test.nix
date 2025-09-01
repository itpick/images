{ pkgs, image }:

pkgs.writeShellScript "test-gradle" ''
  set -euo pipefail
  
  echo "🧪 Testing gradle image functionality..."
  
  # Test 1: Gradle version
  echo "  ✓ Testing gradle version..."
  docker run --rm ${image.imageName}:test gradle --version | grep -q "Gradle"
  
  # Test 2: Java availability
  echo "  ✓ Testing Java runtime..."
  docker run --rm ${image.imageName}:test java --version | grep -q "openjdk"
  
  # Test 3: Basic Gradle project
  echo "  ✓ Testing Gradle project creation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf gradle-test &&
    mkdir gradle-test && cd gradle-test &&
    gradle init --type basic --dsl groovy --no-incubating &&
    ls -la | grep -q "build.gradle"
  '
  
  # Test 4: Gradle help
  echo "  ✓ Testing gradle help..."
  docker run --rm ${image.imageName}:test gradle --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All gradle tests passed!"
''