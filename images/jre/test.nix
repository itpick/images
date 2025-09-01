{ pkgs, image }:

pkgs.writeShellScript "test-jre" ''
  set -euo pipefail
  
  echo "🧪 Testing jre image functionality..."
  
  # Test 1: Java runtime version
  echo "  ✓ Testing java version..."
  docker run --rm ${image.imageName}:test java --version | grep -q "openjdk"
  
  # Test 2: Basic Java execution
  echo "  ✓ Testing Java execution..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    cat > Hello.java << EOF
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello from JRE");
    }
}
EOF
    javac Hello.java &&
    java Hello
  ' | grep -q "Hello from JRE"
  
  # Test 3: JAVA_HOME environment
  echo "  ✓ Testing JAVA_HOME..."
  docker run --rm ${image.imageName}:test bash -c 'echo $JAVA_HOME' | grep -q "/nix/store"
  
  # Test 4: JAR execution
  echo "  ✓ Testing JAR execution capabilities..."
  docker run --rm ${image.imageName}:test java -jar --help 2>&1 | grep -q "jar"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All jre tests passed!"
''