FROM manjarolinux/base:latest
ENV HOME /root
RUN	pacman -Syy
RUN pacman -S --needed --noconfirm git base-devel zsh vim curl yay openssh fzf ripgrep wget
ENV EDITOR vim
RUN git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
RUN $HOME/.homesick/repos/homeshick/bin/homeshick clone dannyzen/dotfiles -b
RUN $HOME/.homesick/repos/homeshick/bin/homeshick link dotfiles -f
RUN chsh -s $(which zsh)
ENTRYPOINT ["/bin/zsh"]
