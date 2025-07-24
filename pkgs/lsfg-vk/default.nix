{ lib, stdenv, fetchFromGitHub, cmake, vulkan-loader, SDL2, pkg-config, clang, wayland-protocols }:

stdenv.mkDerivation rec {
  pname = "lsfg-vk";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "PancakeTAS";
    repo = "lsfg-vk";
    rev = "develop";
    sha256 = "9Qt/Nr38+f8gFhmdS7SbYPcrSksn+/MH8flA1J5Iisk=";
    fetchSubmodules = true;
  };

  waylandProtocolsSrc = fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "4.5.0"; # or whatever version is expected
    sha256 = "sha256-Uqqzq5shDp0AgSBT5waHBNUkEu0LRj70SNOlR5R2yAM=";
  };

  raylibSrc = fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "4.5.0"; # or whatever version is expected
    sha256 = "sha256-Uqqzq5shDp0AgSBT5waHBNUkEu0LRj70SNOlR5R2yAM=";
  };

  toml11Src = fetchFromGitHub {
    owner = "ToruNiina";
    repo = "toml11";
    rev = "v3.7.1"; # change if needed
    sha256 = "sha256-HnhXBvIjo1JXhp+hUQvjs83t5IBVbNN6o3ZGhB4WESQ=";
  };

  nativeBuildInputs = [ cmake pkg-config clang ];
  buildInputs = [ vulkan-loader SDL2 ];

  postPatch = ''
    mkdir -p thirdparty/raylib
    cp -R --no-preserve=mode,ownership ${raylibSrc}/* thirdparty/raylib/

    mkdir -p thirdparty/toml11
    cp -R --no-preserve=mode,ownership ${toml11Src}/* thirdparty/toml11/
  '';



  installPhase = ''
    mkdir -p $out/bin
    cp ./build/lsfg-vk $out/bin/
  '';

  meta = with lib; {
    description = "Lossless Scaling's Frame Generation";
    homepage = "https://github.com/PancakeTAS/lsfg-vk";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
