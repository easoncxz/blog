{
  description = "Dev environment for building Github Pages";

  inputs = {
    fooPkgs.url = "github:NixOS/nixpkgs";
    nilPkg.url = "github:oxalica/nil";
  };

  outputs = ii:
    let
      inherit (ii) self fooPkgs;
      mySystem = "x86_64-linux";
      myPkgs = fooPkgs.legacyPackages.${mySystem};
    in
      {
        packages.${mySystem} = {
          #default = self.packages.x86_64-linux.devShells.${mySystem}.default;
        };

        devShells = {
          ${mySystem}.default = myPkgs.mkShell {
            packages = [
              myPkgs.ruby
              myPkgs.rake
              myPkgs.bundler
              myPkgs.jekyll
              # other useful things
            ];
          };
        };
      };
}
