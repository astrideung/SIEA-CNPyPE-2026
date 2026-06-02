from pathlib import Path
import re
import sys
from reportlab.lib.pagesizes import LETTER
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors
from reportlab.lib.units import cm
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, ListFlowable, ListItem, PageBreak

ROOT = Path(__file__).resolve().parents[1]
md_path = ROOT / (sys.argv[1] if len(sys.argv) > 1 else "MANUAL_USUARIO.md")
pdf_path = ROOT / (sys.argv[2] if len(sys.argv) > 2 else "MANUAL_USUARIO.pdf")

if not md_path.exists():
    raise FileNotFoundError(f"No existe el archivo Markdown: {md_path}")

text = md_path.read_text(encoding="utf-8")
lines = text.splitlines()

styles = getSampleStyleSheet()
styles.add(ParagraphStyle(
    name="H1Custom",
    parent=styles["Heading1"],
    fontSize=18,
    leading=22,
    textColor=colors.HexColor("#1a5276"),
    spaceAfter=10,
))
styles.add(ParagraphStyle(
    name="H2Custom",
    parent=styles["Heading2"],
    fontSize=13,
    leading=17,
    textColor=colors.HexColor("#154360"),
    spaceBefore=8,
    spaceAfter=6,
))
styles.add(ParagraphStyle(
    name="BodyCustom",
    parent=styles["BodyText"],
    fontSize=10.5,
    leading=14,
    spaceAfter=4,
))
styles.add(ParagraphStyle(
    name="SmallCustom",
    parent=styles["BodyText"],
    fontSize=9,
    textColor=colors.HexColor("#374151"),
    leading=12,
))


def inline_format(value: str) -> str:
    value = value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    value = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", value)
    value = re.sub(r"`(.+?)`", r"<font face='Courier'>\1</font>", value)
    return value


def flush_bullets(story, bullets):
    if not bullets:
        return
    items = [
        ListItem(Paragraph(inline_format(item), styles["BodyCustom"]), leftIndent=8)
        for item in bullets
    ]
    story.append(ListFlowable(items, bulletType="bullet", leftIndent=14))
    story.append(Spacer(1, 6))
    bullets.clear()


doc = SimpleDocTemplate(
    str(pdf_path),
    pagesize=LETTER,
    leftMargin=2 * cm,
    rightMargin=2 * cm,
    topMargin=2 * cm,
    bottomMargin=2 * cm,
    title="Manual SIEA",
)

story = []
bullets = []

for line in lines:
    raw = line.rstrip()
    stripped = raw.strip()

    if not stripped:
        flush_bullets(story, bullets)
        story.append(Spacer(1, 5))
        continue

    if stripped == "---":
        flush_bullets(story, bullets)
        story.append(Spacer(1, 6))
        continue

    if stripped.startswith("# "):
        flush_bullets(story, bullets)
        if story:
            story.append(PageBreak())
        story.append(Paragraph(inline_format(stripped[2:]), styles["H1Custom"]))
        story.append(Spacer(1, 6))
        continue

    if stripped.startswith("## "):
        flush_bullets(story, bullets)
        story.append(Paragraph(inline_format(stripped[3:]), styles["H2Custom"]))
        continue

    if stripped.startswith("- "):
        bullets.append(stripped[2:])
        continue

    if re.match(r"^\d+\.\s+", stripped):
        flush_bullets(story, bullets)
        story.append(Paragraph(inline_format(stripped), styles["BodyCustom"]))
        continue

    flush_bullets(story, bullets)
    style = styles["SmallCustom"] if stripped.startswith("**Versión") or stripped.startswith("**Fecha") else styles["BodyCustom"]
    story.append(Paragraph(inline_format(stripped), style))

flush_bullets(story, bullets)
doc.build(story)
print(f"PDF generado: {pdf_path}")
