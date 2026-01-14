# My Dotfiles

![dotfiles](https://img.shields.io/badge/dotfiles-chezmoi-blueviolet)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Linux-orange)

> 个人开发环境配置文件，使用 [Chezmoi](https://chezmoi.io/) 管理

这个仓库包含了我的所有开发环境配置文件，包括 shell、编辑器、终端、开发工具等。所有配置都通过 chezmoi 进行版本控制和跨机器同步。

## ✨ 功能特性

- 🎯 **统一管理**：使用 chezmoi 集中管理所有配置文件
- 🔒 **安全性**：支持加密敏感信息（如 API 密钥）
- 🔄 **跨平台**：支持在不同机器间同步配置
- 📦 **自动化**：一键应用所有配置
- 🎨 **美观**：精心调教的终端和编辑器主题

## 🛠️ 包含的工具

### Shell & 提示符
- **Zsh** - 功能强大的交互式 shell
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - 快速的 Zsh 主题
  - zsh-autosuggestions - 自动建议
  - zsh-syntax-highlighting - 语法高亮
- **Fish** - 友好且智能的交互式 shell
- **Starship** - 跨 shell 的轻量级提示符

### 终端
- **Kitty** - 高性能 GPU 加速终端模拟器
  - 支持主题切换
  - 自定义快捷键和配置

### 编辑器
- **Neovim** - 现代化的 Vim 编辑器
  - [LazyVim](https://github.com/LazyVim/LazyVim) 配置
  - Lua 插件管理
  - LSP、自动补全、语法高亮
- **Vim** - 经典的编辑器配置

### 开发工具
- **Git** - 版本控制配置
- **VSCode** - Visual Studio Code 配置
  - 用户设置
  - 键盘绑定
  - 代码片段
  - 扩展同步配置

## 📥 安装

### 前置要求

- Linux 系统
- Git
- [Chezmoi](https://chezmoi.io/) >= 2.0.0
- （可选）GitHub CLI (`gh`)

### 一键安装

```bash
# 1. 安装 chezmoi
curl -fsSL https://chezmoi.io/get | sh

# 2. 克隆配置
gh repo clone MciG-ggg/dotfiles ~/.local/share/chezmoi

# 3. 应用所有配置
chezmoi apply
```

### 手动安装

```bash
# 1. 安装 chezmoi
curl -fsSL https://chezmoi.io/get | sh

# 2. 初始化 chezmoi
chezmoi init https://github.com/MciG-ggg/dotfiles.git

# 3. 应用配置
chezmoi apply
```

## 🚀 使用方法

### 基本命令

```bash
# 查看已管理的文件
chezmoi managed

# 查看配置文件状态
chezmoi status

# 编辑配置文件（编辑源文件）
chezmoi edit ~/.vimrc

# 添加新配置文件
chezmoi add ~/.config/example.conf

# 应用所有配置
chezmoi apply

# 更新仓库
cd ~/.local/share/chezmoi
git pull
chezmoi apply
```

### 添加新配置

```bash
# 添加单个文件
chezmoi add ~/.config/example.conf

# 递归添加整个目录
chezmoi add --recursive ~/.config/myapp

# 添加但保持为模板（支持变量替换）
chezmoi add --template ~/.config/example.conf
```

### 提交更改

```bash
# 方法 1：在 chezmoi 源目录中提交
cd ~/.local/share/chezmoi
git add .
git commit -m "描述你的更改"
git push

# 方法 2：使用 chezmoi 的 cd 命令
chezmoi cd
git add .
git commit -m "描述你的更改"
git push
```

## 📁 项目结构

```
.
├── dot_gitconfig              # Git 配置
├── dot_p10k.zsh               # Powerlevel10k 主题配置
├── dot_vimrc                  # Vim 配置
├── dot_zshrc                  # Zsh 配置
├── private_dot_config/        # 配置目录
│   ├── fish/                  # Fish shell 配置
│   │   ├── config.fish
│   │   ├── fish_variables
│   │   └── conf.d/
│   ├── kitty/                 # Kitty 终端配置
│   │   ├── kitty.conf
│   │   └── current-theme.conf
│   ├── nvim/                  # Neovim 配置
│   │   ├── init.lua
│   │   ├── lua/
│   │   └── lazy-lock.json
│   ├── private_Code/          # VSCode 配置
│   │   └── User/
│   │       ├── settings.json
│   │       ├── keybindings.json
│   │       ├── snippets/
│   │       └── sync/
│   └── starship.toml          # Starship 提示符配置
└── README.md                  # 本文件
```

## 🎨 自定义配置

### Shell 主题

#### Powerlevel10k
配置文件位于 `~/.p10k.zsh`，重新配置：
```bash
p10k configure
```

#### Starship
配置文件位于 `~/.config/starship.toml`，重新配置：
```bash
# 查看预设
starship preset

# 应用预设
starship preset gruvbox-rainbow > ~/.config/starship.toml
```

### Neovim

Neovim 使用 LazyVim 配置，插件通过 lazy.nvim 管理。

首次启动时会自动安装所有插件：
```bash
nvim
```

手动更新插件：
```bash
nvim --headless "+Lazy! sync" +qa
```

### Kitty

Kitty 主题存储在 `~/.config/kitty/kitty-themes/`，切换主题：
```bash
# 编辑 kitty.conf
# 引入不同的主题文件
```

## 🔐 安全建议

### 加密敏感信息

对于包含敏感信息的文件（如 API 密钥、密码），使用 chezmoi 的加密功能：

```bash
# 加密文件
chezmoi add --encrypt ~/.config/secret.conf

# 解密查看（仅限本机）
chezmoi decrypt ~/.config/secret.conf
```

### 私有配置

使用 `.chezmoiignore` 排除不需要同步的文件：
```bash
echo ".local/share/chezmoi/.chezmoiignore" >> ~/.gitignore
```

## 🔄 备份与恢复

### 备份

```bash
# 在当前机器上
cd ~/.local/share/chezmoi
git add .
git commit -m "Backup $(date +%Y-%m-%d)"
git push
```

### 在新机器上恢复

```bash
# 1. 安装基础工具
curl -fsSL https://chezmoi.io/get | sh

# 2. 克隆配置
gh repo clone MciG-ggg/dotfiles ~/.local/share/chezmoi

# 3. 应用配置
chezmoi apply

# 4. 重启 shell 或重新登录
exec zsh  # 或 exec fish
```

## 🛠️ 故障排除

### chezmoi 命令未找到

```bash
# 将 chezmoi 添加到 PATH
export PATH="$HOME/bin:$PATH"

# 或添加到 ~/.zshrc 的 PATH 中
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
```

### 配置未生效

```bash
# 重新应用所有配置
chezmoi apply

# 检查配置状态
chezmoi status
```

### Git 推送失败

```bash
# 检查远程仓库
cd ~/.local/share/chezmoi
git remote -v

# 重新添加远程仓库
git remote set-url origin git@github.com:MciG-ggg/dotfiles.git
```

## 📚 参考资源

- [Chezmoi 官方文档](https://chezmoi.io/)
- [Powerlevel10k 文档](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
- [Starship 文档](https://starship.rs/)
- [Kitty 文档](https://sw.kovidgoyal.net/kitty/)
- [Neovim 文档](https://neovim.io/doc/)
- [LazyVim 文档](https://lazyvim.github.io/)

## 📝 更新日志

### 2026-01-14
- ✅ 初始化 chezmoi 配置
- ✅ 添加 Zsh + Powerlevel10k 配置
- ✅ 添加 Fish Shell 配置
- ✅ 添加 Starship 配置
- ✅ 添加 Neovim + LazyVim 配置
- ✅ 添加 Kitty 终端配置
- ✅ 添加 VSCode 配置
- ✅ 添加 Vim 配置
- ✅ 配置 PATH 并创建 README

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 💡 提示

> **⚠️ 注意**：在应用这些配置之前，建议先备份您现有的配置文件：
> ```bash
> mkdir -p ~/dotfiles-backup
> cp ~/.zshrc ~/dotfiles-backup/
> cp ~/.vimrc ~/dotfiles-backup/
> cp -r ~/.config ~/dotfiles-backup/
> ```

---

**享受你的完美开发环境！** 🚀

如有问题，请提交 [Issue](https://github.com/MciG-ggg/dotfiles/issues)
