# helpme

`helpme` is a Bash script that opens a new tmux split and starts an assistant CLI with context from your original pane.

## Quick Start

Requirements:

- `tmux`
- At least one assistant CLI: `opencode`, `codex`, `claude`, etc

Run from inside a tmux pane:

```bash
helpme
```

## Configuration

`HELPME_COMMAND` is the only configuration variable.

Default when unset:

```bash
opencode --prompt
```

Set it per command:

```bash
HELPME_COMMAND="codex" helpme
HELPME_COMMAND="claude" helpme
```

Set it in your shell config:

```bash
# ~/.zshrc or ~/.bashrc
export HELPME_COMMAND="codex"
```

```bash
# ~/.zshrc or ~/.bashrc
export HELPME_COMMAND="claude"
```

## Development

Format script:

```bash
just fmt
```

Check formatting:

```bash
just fmt-check
```

