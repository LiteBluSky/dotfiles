<p align="center">
  <img src="fastfetch-logo.svg" alt="fastfetch logo" width="600">
</p>

# Massive's Terminal Dotfiles

Automated terminal environment configuration for Windows 11 and Linux (Debian/Ubuntu) managed by **Chezmoi**.

This repository automatically provisions your package managers (`scoop`, `winget`, `apt`), installs your complete CLI toolchain, configures environment variables, and deploys your configuration maps seamlessly.

## Fast Installation

Pick the block for your OS and profile (`home` or `work`) below and paste it as-is —
nothing to edit.

### Windows

**Home:**

```powershell
$env:CHEZMOI_PROFILE="home"; winget install --accept-package-agreements --accept-source-agreements twpayne.chezmoi; $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"); chezmoi init --apply LiteBluSky
```

**Work:**

```powershell
$env:CHEZMOI_PROFILE="work"; winget install --accept-package-agreements --accept-source-agreements twpayne.chezmoi; $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"); chezmoi init --apply LiteBluSky
```

> [!NOTE]
> `winget` adds `chezmoi` to your PATH, but an already-running PowerShell session
> doesn't see that change until it's reloaded. The `$env:Path = ...` step reloads
> PATH from the registry in the same session, so the trailing `chezmoi init --apply`
> can find the binary immediately — no need to close the terminal and run the
> command again.

If you're on `Nushell` and the dotfiles have already been applied, use this instead:

```nushell
with-env { CHEZMOI_PROFILE: "home" } { chezmoi init --apply }
```

```nushell
with-env { CHEZMOI_PROFILE: "work" } { chezmoi init --apply }
```

> [!IMPORTANT]
> Use `init --apply` (not `apply`) so the profile change is actually re-rendered into
> `chezmoi.toml` — plain `apply` reuses the cached config and ignores the env var.

### Linux (Debian/Ubuntu)

**Home:**

```bash
CHEZMOI_PROFILE=home sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply LiteBluSky
```

**Work:**

```bash
CHEZMOI_PROFILE=work sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply LiteBluSky
```

This downloads `chezmoi` and immediately runs `init --apply` with it in the same
step, so there's no PATH to refresh and no second command to run. From there, the
repo's own bootstrap scripts install `Nushell` via `apt` and provision the rest of
the toolchain automatically.

If the dotfiles are already applied and you just want to switch profiles:

```bash
CHEZMOI_PROFILE=home chezmoi init --apply
```

```bash
CHEZMOI_PROFILE=work chezmoi init --apply
```
