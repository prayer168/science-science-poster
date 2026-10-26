# Reference analysis and template-selection workflow

## Local reference set reviewed

This release was informed by the user-curated reference collection used in the 66th Taiwan Science Fair poster project:

- Domestic poster references: 56 raster images and 15 PDFs.
- International academic-poster references: 120 PDFs, with 8 contact-sheet overviews.
- Historical winning science-fair project collection: 1,732 PDFs. These are research reports/project samples; use them for science-fair content conventions, not as if every file were a poster.

The international contact sheets and domestic overview images were visually reviewed for title hierarchy, reading direction, evidence density, chart/photo balance, section geometry, color use, and panel continuity. This produced the template taxonomy in `templates.json`.

## What the analysis found

1. Strong posters establish one clear entry point, then lead the reader through a visible sequence.
2. Results become easier to scan when charts are grouped by a question or factor, use common scales, and have direct labels.
3. Field and engineering projects benefit from small, dated evidence photos with captions rather than a few oversized decorative photos.
4. Maps, process diagrams, comparison matrices, and evidence photo grids work best when the study question determines their placement.
5. International examples often use modular cards, restrained color, asymmetric image-led layouts, or a single prominent result; domestic award examples frequently foreground research flow, method details, diagrams, and tables.
6. Three-panel work should connect through numbering, shared color bands, arrows, or a continuous timeline while letting each panel stand alone. The banner should have its own composition.

## The 24 schematic templates

The gallery contains 24 original wireframe previews. They abstract composition principles observed in the references; they do not reproduce source posters, logos, exact text, or images. Each catalog entry includes a name, category, use case, short design description, and a miniature example.

The eight palette presets are independent of layout. A user may select one palette for all boards or ask for controlled variation by panel. Template choice and palette choice are starting points: content and event specifications take priority over rigid reproduction.

## Start-of-task sequence

At the beginning of each project, collect or confirm:

1. The folder path containing the science-fair materials.
2. The required board count and the width/height/orientation for each board and banner.
3. Language and viewing-distance/readability needs.
4. A layout template for each of the four boards (from the gallery) and an overall palette; permit reuse or mixing.
5. Optional image/text balance, must-keep content, and print/export requirements.

If the user wants to browse, open `template-gallery.html`. They can enter the path, dimensions, four template IDs, and palette, then copy/download the JSON configuration to continue in Codex. The gallery does not access files or start poster production. Once the user gives the source path and confirms a usable style configuration, inventory and analyze the materials before producing the poster set. If the path is inaccessible or dimensions are missing, resolve that first.

## Reuse and attribution boundaries

Reference files can include third-party copyrighted artwork. Keep them on the user's machine and do not commit or redistribute them with this skill. Public gallery previews are newly drawn schematic diagrams. Reuse high-level layout principles; do not trace a specific poster or copy its text, illustrations, logos, or distinctive artwork.
