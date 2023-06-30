{
        description = "My FAISS development environment";
        nixConfig.bash-prompt = "\[FAISS\]$";

        inputs = { 
                flake-utils.url = "github:numtide/flake-utils";
        };
        outputs = { self, nixpkgs, flake-utils }:
                flake-utils.lib.eachSystem [ flake-utils.lib.system.x86_64-linux ]
                (system:
                 let
                        pkgs = import nixpkgs {
                                config = { allowUnfree = true; };
                                inherit system;
                        };
                        python311pkg = pkgs.python311Packages;
                 in {
                        devShells.default = pkgs.mkShell {
                        #packages = [pkgs.gcc13 pkgs.cmake pkgs.mkl pkgs.python311 pkgs.swig4 python311pkg.numpy python311pkg.setuptools]; #mkl
                        packages = [pkgs.gcc13 pkgs.cmake pkgs.openblas pkgs.python311 pkgs.swig4 python311pkg.numpy python311pkg.setuptools]; # openblas
                        #shellHook = '''';
                 };
                 });
}
