{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ollama-cuda
    n8n
    searxng

    # (extra.ollama.override {
    #   acceleration = "cuda";
    # })
    # pkgs.oterm
  ];
}
