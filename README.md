<h1 align="center">
  ☑️  + 🚀
  <br>Spaceship Taskwarrior<br>
</h1>

<h4 align="center">
  A <a href="https://taskwarrior.org" target="_blank">Taskwarrior</a> section for Spaceship prompt
</h4>

<p align="center">
  <a href="https://github.com/danarth/spaceship-taskwarrior/releases">
    <img src="https://img.shields.io/github/v/release/danarth/spaceship-taskwarrior.svg?style=flat-square"
      alt="GitHub Release" />
  </a>

  <a href="https://github.com/danarth/spaceship-taskwarrior/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/danarth/spaceship-taskwarrior/ci.yaml?style=flat-square"
      alt="GitHub Workflow Status" />
  </a>
</p>

Number of pending Taskwarrior tasks, using `task status:pending count`.

## Pre-requisites

You must have Taskwarrior installed in order for this section to work correctly.

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/danarth/spaceship-taskwarrior.git $ZSH_CUSTOM/plugins/spaceship-section
```

Include `spaceship-section` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-section)
```

### [zplug]

```zsh
zplug "danarth/spaceship-taskwarrior"
```

### [antigen]

```zsh
antigen bundle "danarth/spaceship-taskwarrior@main"
```

### [antibody]

```zsh
antibody bundle "danarth/spaceship-taskwarrior@main"
```

### [zinit]

```zsh
zinit light "danarth/spaceship-taskwarrior@main"
```

### [zgen]

```zsh
zgen load "danarth/spaceship-taskwarrior@main"
```

### [sheldon]

```toml
[plugins.spaceship-section]
github = "danarth/spaceship-taskwarrior@main"
```

### Manual

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship-section`.
2. Source this section in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/danarth/spaceship-taskwarrior.git "$HOME/.zsh/spaceship-warrior"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "~/.zsh/spaceship-warrior/spaceship-taskwarrior.plugin.zsh"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include Ember section in the prompt:

```zsh
spaceship add taskwarrior
```

## Options

This section is shown only in directories within a foobar context.

| Variable                   |              Default               | Meaning                              |
| :------------------------- | :--------------------------------: | ------------------------------------ |
| `SPACESHIP_TASKWARRIOR_SHOW`   |               `true`               | Show current section                 |
| `SPACESHIP_TASKWARRIOR_PREFIX` | `with ` | Prefix before section                |
| `SPACESHIP_TASKWARRIOR_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after section                 |
| `SPACESHIP_TASKWARRIOR_SYMBOL` |               `󰱒`                | Character to be shown before number of tasks |
| `SPACESHIP_TASKWARRIOR_COLOR`  |             `green`               | Color of section                     |

## Contributing

First, thanks for your interest in contributing!

Contribute to this repo by submitting a pull request. Please use [conventional commits](https://www.conventionalcommits.org/), since this project adheres to [semver](https://semver.org/) and is automatically released via [semantic-release](https://github.com/semantic-release/semantic-release).

## License

MIT © [Daniel Arthur](https://danielarthur.uk)

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
