{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ollama-cuda
    #opencode
    #n8n
    #searxng
  ];
}
