echo '\n** Preparing install **'
rm $HOME/.tmux.conf
rm $HOME/.zshrc
rm $HOME/.vimrc
rm -rf $HOME/.config/nvim/
rm -rf $HOME/.vim

ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/zshrc $HOME/.zshrc
ln -sf $PWD/vimrc $HOME/.vimrc
mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvimrc $HOME/.config/nvim/init.vim

echo '\n** Configuring vim **'
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo '\n** Configuring neo-vim **'
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

text='"""

{{_indent_}}Parameters
{{_indent_}}----------

{{_arg_}} : {{_lf_}}
{{_indent_}}Returns
{{_indent_}}-------
"""'
echo "$text" > $HOME/.vim/plugged/vim-pydocstring/template/pydocstring/multi.txt

echo "\n** Checking you are using the correct shell.. **."
if [ -n "$ZSH_VERSION"];
then
    echo "   # Good, you are already using zsh"
else
    echo "   # Current shell is not zsh, changing it. Please enter password."
    chsh -s `which zsh`
fi

echo '\n\n*** Congratulations! You are all set up!! ***\n'
