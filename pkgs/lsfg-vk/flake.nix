{
  description = "Lossless Scaling Frame Generation on Linux via DXVK/Vulkan";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        lsfg-vk = pkgs.stdenv.mkDerivation rec {
          pname = "lsfg-vk";
          version = "unstable-2025-07-26";

          src = pkgs.fetchFromGitHub {
            owner = "PancakeTAS";
            repo = "lsfg-vk";
            rev = "v0.9.0"; # Use latest develop branch
            hash =
              "sha256-V2/ILhanlSSwfLz0pqGO9QCKBdTLB56a+Q3wuJMCUMA="; # You'll need to update this
            fetchSubmodules = true;
          };

          nativeBuildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            clang
            meson # For DXVK dependency
          ];

          buildInputs = with pkgs; [
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers
            libGL
            libGLU
            xorg.libX11
            xorg.libXext
            xorg.libXfixes
            xorg.libXi
            xorg.libXrandr
            xorg.libXcursor
            libxkbcommon
            wayland
            wayland-protocols
          ];

          # Force clang usage since the project doesn't compile well with GCC
          CC = "${pkgs.clang}/bin/clang";
          CXX = "${pkgs.clang}/bin/clang++";

          cmakeFlags = [
            "-DCMAKE_BUILD_TYPE=Release"
            "-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON"
            "-DCMAKE_CXX_CLANG_TIDY="
          ];

          # Patch the CMakeLists.txt to work better with Nix
          postPatch = ''
            # Remove any hardcoded paths if they exist
            # This might need adjustment based on the actual CMakeLists.txt content
            substituteInPlace CMakeLists.txt \
              --replace-fail "/usr/include" "${pkgs.vulkan-headers}/include" || true
          '';

          installPhase = ''
                        runHook preInstall
                        
                        mkdir -p $out/lib
                        mkdir -p $out/bin
                        mkdir -p $out/share/vulkan/explicit_layer.d
                        
                        # Install the shared library
                        cp -r lib/* $out/lib/ || true
                        cp *.so $out/lib/ || true
                        cp liblsfg-vk.so $out/lib/ || true
                        
                        # Create a wrapper script for easier usage
                        cat > $out/bin/lsfg-vk-run << 'EOF'
            #!/usr/bin/env bash
            export LD_PRELOAD="$out/lib/liblsfg-vk.so:$LD_PRELOAD"
            exec "$@"
            EOF
                        chmod +x $out/bin/lsfg-vk-run
                        
                        # Install Vulkan layer manifest if it exists
                        if [ -f vulkan_layer.json ]; then
                          cp vulkan_layer.json $out/share/vulkan/explicit_layer.d/lsfg-vk.json
                        fi
                        
                        runHook postInstall
          '';

          meta = with pkgs.lib; {
            description =
              "Lossless Scaling Frame Generation on Linux via DXVK/Vulkan";
            longDescription = ''
              This project brings Lossless Scaling's Frame Generation to Linux!
              LSFG is primarily written in DirectX 11 compute shaders, which are
              translated to SPIR-V using DXVK. The surrounding parts have been
              rewritten in plain Vulkan code to make LSFG run natively on Linux.

              Note: This requires the proprietary Lossless.dll from Steam.
            '';
            homepage = "https://github.com/PancakeTAS/lsfg-vk";
            license = licenses.mit; # Depends on proprietary Lossless Scaling
            maintainers = [ ];
            platforms = platforms.linux;
            broken = false;
          };
        };

      in {
        packages = {
          default = lsfg-vk;
          lsfg-vk = lsfg-vk;
        };

        apps = {
          default = {
            type = "app";
            program = "${lsfg-vk}/bin/lsfg-vk-run";
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            clang
            meson
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers
            vulkan-tools
            git
          ];

          shellHook = ''
            echo "lsfg-vk development environment"
            echo "Build with: cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release"
            echo "Then: cmake --build build"
          '';
        };
      });
}
