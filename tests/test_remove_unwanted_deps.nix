{
  baseArgsMkPython ? {},
  baseArgsBuildPythonPackage ? {},
  mach-nix ? import ../. {},
  ...
}:
with builtins;

# if removing dependency doesn't work this build would raise:
# Could not find a version that satisfies the requirement packaging (from sphinx)
mach-nix.mkPython (baseArgsMkPython // {
  python = "python312";
  requirements = ''
    librosa==0.9.0
  '';
  providers.soundfile = "sdist";
  providers._default = "wheel,sdist,nixpkgs";
})
