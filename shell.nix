{ pkgs ? import <nixpkgs> {} }:

let
	serve = pkgs.writeShellScriptBin "serve" ''
		${pkgs.python3}/bin/python3 -m http.server --bind ::0 "$@"
	'';
in

pkgs.mkShell {
	buildInputs = with pkgs; [
		nodePackages.prettier
		serve
	];
}
