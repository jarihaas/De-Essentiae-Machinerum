{
  description = "XeLaTeX environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          (pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-medium
              xetex
              collection-latexextra;
          })
        ];
      };
    };
}