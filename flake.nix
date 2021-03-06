{
  description = ''Unicode text segmentation tr29'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."segmentation-master".dir   = "master";
  inputs."segmentation-master".owner = "nim-nix-pkgs";
  inputs."segmentation-master".ref   = "master";
  inputs."segmentation-master".repo  = "segmentation";
  inputs."segmentation-master".type  = "github";
  inputs."segmentation-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."segmentation-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."segmentation-v0_0_1".dir   = "v0_0_1";
  inputs."segmentation-v0_0_1".owner = "nim-nix-pkgs";
  inputs."segmentation-v0_0_1".ref   = "master";
  inputs."segmentation-v0_0_1".repo  = "segmentation";
  inputs."segmentation-v0_0_1".type  = "github";
  inputs."segmentation-v0_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."segmentation-v0_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."segmentation-v0_1_0".dir   = "v0_1_0";
  inputs."segmentation-v0_1_0".owner = "nim-nix-pkgs";
  inputs."segmentation-v0_1_0".ref   = "master";
  inputs."segmentation-v0_1_0".repo  = "segmentation";
  inputs."segmentation-v0_1_0".type  = "github";
  inputs."segmentation-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."segmentation-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}