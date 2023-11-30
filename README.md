- Make a backup of your current Neovim files:

```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

- Install system dependencies:

```sh
apt install build-essential \
  curl \
  ripgrep \
  nodejs
```

- Clone configuration:

  ```sh
  git clone https://github.com/gvital3230/nvim-config ~/.config/nvim
  ```

- Start Neovim!

  ```sh
  nvim
  ```
