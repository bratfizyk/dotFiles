{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #aider-chat-full
    ollama-cuda
    opencode
    #n8n
    #searxng
  ];
}
