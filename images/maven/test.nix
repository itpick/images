{ pkgs, image }:

pkgs.writeShellScript "test-maven" ''
  set -euo pipefail
  
  echo "🧪 Testing maven image functionality..."
  
  # Test 1: Maven version
  echo "  ✓ Testing maven version..."
  docker run --rm ${image.imageName}:test mvn --version | grep -q "Apache Maven"
  
  # Test 2: Java availability
  echo "  ✓ Testing Java runtime..."
  docker run --rm ${image.imageName}:test java --version | grep -q "openjdk"
  
  # Test 3: Maven archetype
  echo "  ✓ Testing Maven project creation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf maven-test &&
    mvn archetype:generate -DgroupId=com.example -DartifactId=maven-test -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false &&
    ls maven-test | grep -q "pom.xml"
  '
  
  # Test 4: Maven help
  echo "  ✓ Testing maven help..."
  docker run --rm ${image.imageName}:test mvn --help | grep -q "usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All maven tests passed!"
''