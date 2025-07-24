{ lib, stdenv, fetchFromGitHub, cmake, vulkan-loader, SDL2, pkg-config }:

stdenv.mkDerivation rec {
  pname = "lsfg-vk";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "PancakeTAS";
    repo = "lsfg-vk";
    rev = "v${version}";
    sha256 = "REPLACE_ME"; # use `nix hash` to get this
  };

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ vulkan-loader SDL2 ];

  installPhase = ''
    mkdir -p $out/bin
    cp lsfg-vk $out/bin/
  '';

  meta = with lib; {
    description = "Lossless Scaling's Frame Generation";
    homepage = "https://github.com/PancakeTAS/lsfg-vk";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
