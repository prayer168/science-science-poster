# Science Fair Poster

A Codex skill for turning science fair reports, datasets, project photos, and event specifications into polished, research-grounded, editable poster presentations.

## Install the skill and poster toolchain (Windows)

Install Git, Python 3.12, Go, Inkscape, Scribus, jamovi, then clone Doory, GhostPoster, and Tile; prepare GhostPoster in a private Python environment and build Tile:

```powershell
git clone https://github.com/prayer168/science-science-poster.git
cd science-science-poster
./scripts/install.ps1
```

The script copies the skill to `%USERPROFILE%\.codex\skills\science-fair-poster` and the poster projects to `%USERPROFILE%\.codex\poster-tools`. Restart Codex after installation, then invoke it with `$science-fair-poster`.

When starting a new poster project, open the installed `references/template-gallery.html` (or [open the gallery in this repository](references/template-gallery.html)). It includes 24 schematic layout templates and 8 palettes. Enter the source folder and board sizes, then choose a layout for each of the three boards and the banner. The page generates a JSON brief to paste into Codex. It does not access the folder, upload data, or create posters. The JSON contains the path you entered; keep it private if the path reveals personal or school information.

Options:

- `./scripts/install.ps1 -WhatIf` previews planned changes.
- `./scripts/install.ps1 -SkipSoftware` only copies the skill and clones/prepares projects.
- `./scripts/install.ps1 -SkipProjects` installs the skill and desktop software only.
- `./scripts/install.ps1 -SkipSkillCopy` installs software/projects without changing the local skill files.

The script requires Windows Package Manager (`winget`) and Git. It keeps existing project directories unchanged rather than pulling or overwriting them. If the newly installed Git or Python is not visible in the current shell, restart PowerShell and rerun the script.

### Project notes

- **Doory** is cloned as source only. Starting its self-hosted services requires Docker, generated secrets, and an explicit `docker compose up`; the installer does not start services. Doory has its own attribution license, which must be followed if deployed.
- **GhostPoster** is installed from its upstream Git repository into an isolated Python 3.12 environment with its GUI extra.
- **Tile** is cloned and built from its upstream Go source. Its repository is archived, so it is provided as-is and may not receive fixes.
- **Inkscape** edits vector artwork; **Scribus** handles page layout; **jamovi** supports statistical analysis. Python is available for chart/data workflows.
- **Image generation** uses Codex's built-in image tool when available; it is not a separate package the repository can install.
- The included installer automates Windows only. On macOS/Linux, install equivalent apps from their official sources and follow each upstream project's setup instructions.

Upstream projects: [Doory](https://github.com/shaongitbd/doory), [GhostPoster](https://github.com/nftomczain/GhostPoster), and [Tile](https://github.com/cvsouth/tile).

## What it supports

- Source inventory and research-story planning across multiple poster panels.
- Data-aware charts, source notes, and discrepancy flags.
- Chronological activity-photo tables with captions and credits.
- Generated hero visuals alongside editable PowerPoint body content.
- Preview, layout review, and timestamped project deliverables.

## Version

Current skill version: **1.2.0**. See [CHANGELOG](references/CHANGELOG.md).

## License

MIT. See [LICENSE](LICENSE).
