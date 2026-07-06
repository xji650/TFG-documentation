{
  description = "TFG/TFM Template — entorn reproduïble (LaTeX + eines auxiliars)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, ... }: {

        # `nix build` genera directament el PDF final (thesis/main.pdf)
        packages.default =
          pkgs.stdenv.mkDerivation {
            pname = "thesis";
            version = "1.0";

            src = ./thesis;

            nativeBuildInputs = [
              pkgs.latexmk
              pkgs.texliveFull
            ];

            buildPhase = ''
              latexmk -pdf main.tex
            '';

            installPhase = ''
              mkdir -p $out
              cp main.pdf $out/
            '';
          };

        # `nix develop` obre un terminal amb totes les eines necessàries.
        # Aquest mateix conjunt d'eines és el que s'instal·la a la imatge
        # Docker (Dockerfile), perquè els dos entorns siguin equivalents.
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git
            gnumake
            latexmk
            texliveFull
            pandoc      # opcional: conversió de formats (p. ex. Markdown -> PDF)
            graphviz    # opcional: diagrames generats per script
            python3     # opcional: scripts d'anàlisi/generació de resultats
          ];
        };
      };
    };
}
