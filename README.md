# 科展海報製作 | Science Fair Poster

將科展報告、資料集、作品照片與大會規格，整理成內容有根據、可編輯且專業的研究海報簡報。\
Turn science fair reports, datasets, project photos, and event specifications into polished, research-grounded, editable poster presentations.

## 安裝技能與海報工具 | Install the skill and poster toolchain

Windows 安裝程式會安裝 Git、Python 3.12、Go、Inkscape、Scribus、jamovi，並取得 Doory、GhostPoster 與 Tile 專案：\
On Windows, the installer sets up Git, Python 3.12, Go, Inkscape, Scribus, jamovi, and the Doory, GhostPoster, and Tile projects:

```powershell
git clone https://github.com/prayer168/science-science-poster.git
cd science-science-poster
./scripts/install.ps1
```

安裝程式會將技能複製到 `%USERPROFILE%\.codex\skills\science-fair-poster`，並將海報專案放在 `%USERPROFILE%\.codex\poster-tools`。安裝後重新啟動 Codex，再輸入 `$science-fair-poster` 使用。\
The script copies the skill to `%USERPROFILE%\.codex\skills\science-fair-poster` and poster projects to `%USERPROFILE%\.codex\poster-tools`. Restart Codex after installation, then invoke it with `$science-fair-poster`.

### 選擇版型 | Choose poster styles

開始新專案時，開啟已安裝的 `references/template-gallery.html`，或[直接開啟本倉庫的版型圖庫](references/template-gallery.html)。圖庫提供 24 種示意版型與 8 種色彩配置。輸入資料夾路徑和海報尺寸，再為三張主海報及橫幅各選一種版型。完成後，將產生的 JSON 設計需求貼回 Codex。\
For a new project, open the installed `references/template-gallery.html` or [browse the gallery in this repository](references/template-gallery.html). It offers 24 schematic layouts and 8 color palettes. Enter the source folder and poster sizes, then choose styles for the three main panels and banner. Paste the resulting JSON brief into Codex.

圖庫不會讀取資料夾、上傳資料或製作海報。JSON 會包含你輸入的路徑；若路徑含有個人或學校資訊，請妥善保管。\
The gallery does not access folders, upload data, or create posters. Its JSON includes the path you entered; keep it private if it reveals personal or school information.

### 安裝選項 | Installer options

- `./scripts/install.ps1 -WhatIf`：預覽預計執行的變更。\
  Preview planned changes.
- `./scripts/install.ps1 -SkipSoftware`：只複製技能並取得／準備專案。\
  Copy the skill and clone/prepare projects only.
- `./scripts/install.ps1 -SkipProjects`：只安裝技能與桌面軟體。\
  Install the skill and desktop software only.
- `./scripts/install.ps1 -SkipSkillCopy`：安裝軟體與專案，但不複製技能檔案。\
  Install software and projects without copying the skill files.

安裝程式需要 Windows Package Manager（`winget`）與 Git。若專案資料夾已存在，程式會保留其內容，不會拉取或覆寫。若新安裝的 Git 或 Python 尚未出現在目前的 PowerShell 工作階段，請重新開啟 PowerShell 再執行安裝程式。\
The installer requires Windows Package Manager (`winget`) and Git. Existing project directories are left unchanged; the installer does not pull or overwrite them. If newly installed Git or Python is not available in the current shell, restart PowerShell and rerun the installer.

### 專案說明 | Project notes

- **Doory** 僅下載原始碼。啟動自架服務需要 Docker、產生密鑰，並由使用者明確執行 `docker compose up`；安裝程式不會啟動服務。部署時須遵守 Doory 的署名授權。\
  **Doory** is cloned as source only. Self-hosting requires Docker, generated secrets, and an explicit `docker compose up`; the installer does not start services. Follow Doory's attribution license if deploying it.
- **GhostPoster** 會從上游 Git 儲存庫安裝，並在獨立的 Python 3.12 環境中安裝 GUI 擴充套件。\
  **GhostPoster** is installed from its upstream Git repository in an isolated Python 3.12 environment with its GUI extra.
- **Tile** 會從上游 Go 原始碼複製並建置。該儲存庫已封存，軟體以現況提供，未必會再收到修正。\
  **Tile** is cloned and built from upstream Go source. Its repository is archived, so it is provided as-is and may not receive fixes.
- **Inkscape** 用於向量圖；**Scribus** 用於頁面排版；**jamovi** 支援統計分析；Python 可用於資料處理與繪圖。\
  **Inkscape** edits vector artwork; **Scribus** handles page layout; **jamovi** supports statistical analysis; Python supports data workflows and charting.
- **圖片生成**使用 Codex 內建的影像工具（如帳戶可用），不是此儲存庫能安裝的獨立套件。\
  **Image generation** uses Codex's built-in image tool when available; it is not a standalone package this repository can install.
- 安裝程式目前支援 Windows。macOS／Linux 使用者請從官方來源安裝對應軟體，並依各上游專案的說明完成設定。\
  The installer currently automates Windows only. On macOS/Linux, install equivalent apps from their official sources and follow each upstream project's setup instructions.

上游專案： [Doory](https://github.com/shaongitbd/doory)、[GhostPoster](https://github.com/nftomczain/GhostPoster)、[Tile](https://github.com/cvsouth/tile)。\
Upstream projects: [Doory](https://github.com/shaongitbd/doory), [GhostPoster](https://github.com/nftomczain/GhostPoster), and [Tile](https://github.com/cvsouth/tile).

## 功能 | Features

- 盤點素材，規劃多張海報的研究脈絡。\
  Inventory source material and plan the research story across poster panels.
- 根據資料製作圖表、註明來源並標示資料差異。\
  Create data-aware charts, cite sources, and flag discrepancies.
- 依時間整理活動照片、圖說及拍攝者資訊。\
  Organize activity photos chronologically with captions and photographer credits.
- 結合生成式主視覺與可編輯的 PowerPoint 內文。\
  Combine generated hero visuals with editable PowerPoint body content.
- 預覽與檢視版面，並產生附時間戳記的專案成果。\
  Preview and review layouts, then create timestamped project deliverables.

## 版本 | Version

目前技能版本：**1.2.0**。更新紀錄請見[變更紀錄](references/CHANGELOG.md)。\
Current skill version: **1.2.0**. See the [changelog](references/CHANGELOG.md).

## 標籤 | Topics and hashtags

GitHub Topics：`science-fair` · `scientific-poster` · `poster-design` · `science-education` · `codex-skill` · `open-source` · `jamovi` · `inkscape` · `scribus`\
Hashtags: **#ScienceFair #ScientificPoster #PosterDesign #ScienceEducation #CodexSkill #OpenSource #Jamovi #Inkscape #Scribus**

## 授權 | License

MIT 授權，詳見 [LICENSE](LICENSE)。\
MIT. See [LICENSE](LICENSE).
