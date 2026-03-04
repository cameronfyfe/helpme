{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    (inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
        helpme = pkgs.stdenvNoCC.mkDerivation {
          pname = "helpme";
          version = "0.1.0";
          src = ./.;
          nativeBuildInputs = [ pkgs.makeWrapper ];
          dontConfigure = true;
          dontBuild = true;
          installPhase = ''
            mkdir -p "$out/bin"
            install -m 755 helpme "$out/bin/helpme"
            patchShebangs "$out/bin/helpme"
            wrapProgram "$out/bin/helpme" \
              --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.tmux ]}
          '';
          meta.mainProgram = "helpme";
        };
      in
      {
        packages = {
          default = helpme;
        };

        apps = {
          default = {
            type = "app";
            program = "${helpme}/bin/helpme";
          };
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              bash
              nixpkgs-fmt
              shellcheck
              shfmt
              tmux
            ];
          };
        };
      }));
}
