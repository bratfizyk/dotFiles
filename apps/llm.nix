{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ollama-cuda
    n8n
    searxng
    claude-code
    opencode

    # (extra.ollama.override {
    #   acceleration = "cuda";
    # })
    # pkgs.oterm
  ];
}
