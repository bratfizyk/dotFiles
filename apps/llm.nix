{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aider-chat-full
    ollama-cuda
    #n8n
    #searxng
  ];
}
