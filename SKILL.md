---
name: science-fair-poster
description: Build or revise polished science fair posters from reports, datasets, photos, and event layout specifications. Use for research-story structure, editable poster decks, visualized results, dated photo tables, and print-ready exports.
metadata:
  version: 1.1.0
---

# Science Fair Poster

Turn the supplied science fair materials into a coherent, visually strong poster set that is accurate, readable at print size, and easy to revise.

## Workflow

1. **Confirm inputs and output spec.** Identify the project source folder, required board count/orientation/dimensions, output location, and requested deliverables. Use reasonable defaults from the current conversation when available. If a required spec is missing, inspect supplied event documents before asking.
2. **Inventory and read the sources.** Find the report, raw data, existing charts, activity photos, captions/credits, citations, and any reference posters. Extract report sections and inspect relevant workbook sheets. Make a source inventory and record uncertainties before laying out content.
3. **Build the research narrative.** Organize boards as a continuous story, adapting the sequence to the actual project. A common three-board sequence is motivation/questions/objectives; design/methods/timeline; results/discussion/conclusions/limitations/future research/references. Treat a banner as a separate title visual. Do not force this structure when the event or content suggests a better one.
4. **Validate claims and numbers.** Calculate charts from the source data when possible; otherwise transcribe reported values and label them as report values. Check denominators, units, sample sizes, dates, and whether comparisons support causal or significance claims. Preserve and surface unresolved data conflicts; do not fabricate missing values, attributions, or citations.
5. **Prepare visuals.** Select authentic project images and order them by verified dates. Use compact photo rows/cards when the process matters; include date, concise figure caption, and photographer credit if known or user-specified. Use the built-in image-generation tool for requested or useful hero illustrations. Generated hero artwork may integrate title text as one image; keep detailed body text, data charts, captions, and tables as editable PowerPoint elements whenever practical.
6. **Design and produce.** Favor a strong visual hierarchy, generous but purposeful image area, short readable text, consistent visual language, and variation across boards. Keep body copy large enough for the specified viewing distance and ensure each panel is complete when viewed alone while linking to adjacent panels. Use the presentation-authoring skill/tools when available; otherwise use suitable local authoring tools. Save editable source decks and print/export formats the user requested.
7. **Review and deliver.** Render every panel, inspect the actual previews for clipping, overlap, tiny labels, awkward crops, and sequence continuity. Run available package/layout checks. Create a new timestamped output folder for each full remake when that is the user's established preference; for a narrowly scoped revision, update the named version unless asked to create another version. Include previews and a concise production note describing source assumptions and unresolved issues.

## Persistent project values and versioning

Treat the project topic, source paths, dimensions, board count, language, colors, photo-credit wording, and output location as per-run inputs, not fixed facts. Reuse prior values only when the user says to continue the same project or they are clearly present in the active context.

Skill release version is `1.1.0`. Update `metadata.version` and `references/CHANGELOG.md` when the skill itself changes materially; do not bump it merely because a poster project gets a new timestamped output folder. Preserve prior finished project folders when making later poster editions.

## Software setup

On Windows 10/11, install the skill and its supported poster toolchain from a cloned/downloaded repository by running `./scripts/install.ps1` in PowerShell. The installer uses winget to install Git, Python 3.12, Go, Inkscape, Scribus, and jamovi; clones the Doory, GhostPoster, and Tile projects into `%USERPROFILE%\.codex\poster-tools`; prepares an isolated Python environment for GhostPoster; and builds Tile. Existing project folders are kept as-is. Tile's upstream repository is archived, so treat it as optional legacy software. See the repository README for options and limitations.

Doory is cloned but not launched: self-hosting needs Docker, generated secrets, and explicit service startup. Respect its upstream license and required in-app attribution. Image generation uses Codex's built-in image tool when available; that capability is not a desktop package this installer can bundle. Use equivalent official installers and upstream project instructions on macOS/Linux; the included automation is Windows-specific.

## Deliverables and editability

Default to editable PowerPoint (`.pptx`) when the user requests slides/posters and PowerPoint is available. Provide one file per panel and separate preview images. Keep chart visuals and associated values editable where practical, and cite their source in a chart note or caption. Store generated hero images as separate assets when the project requires reproducibility. Never imply generated-image text or rasterized artwork is editable text.

## Relevant references

- Read [references/CHANGELOG.md](references/CHANGELOG.md) when updating the skill version.

