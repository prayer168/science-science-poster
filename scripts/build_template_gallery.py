"""Embed the template catalog in a standalone gallery that works from file://."""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
catalog = json.loads((ROOT / "references" / "templates.json").read_text(encoding="utf-8"))
template = (ROOT / "references" / "template-gallery.template.html").read_text(encoding="utf-8")
payload = json.dumps(catalog, ensure_ascii=False).replace("</", "<\\/")
(ROOT / "references" / "template-gallery.html").write_text(
    template.replace("__CATALOG_JSON__", payload), encoding="utf-8"
)
print(f"Built gallery with {len(catalog['templates'])} templates and {len(catalog['palettes'])} palettes")
