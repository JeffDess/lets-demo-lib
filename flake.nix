{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    lets.url = "github:JeffDess/lets";
    lets.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, lets, ... }:
    let
      letsTasks = import ./tasks.nix;
    in
    lets.lib.mkFlake {
      inherit nixpkgs;
      systems = [ "x86_64-linux" ];
      tasks = letsTasks;
    }
    // {
      inherit letsTasks;
      inherit (lets) lib;
    };
}
