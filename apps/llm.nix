{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (ollama.override {
      acceleration = "cuda";
    })
    oterm
  ];
}
