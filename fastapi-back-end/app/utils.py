import os
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from datetime import datetime

PDF_FOLDER = os.getenv("PDF_FOLDER", "./receipts")
os.makedirs(PDF_FOLDER, exist_ok=True)

def generate_receipt_pdf(phone: str, items: list, total: int) -> str:
    filename = f"receipt_{phone}_{int(datetime.utcnow().timestamp())}.pdf"
    path = os.path.join(PDF_FOLDER, filename)

    c = canvas.Canvas(path, pagesize=A4)
    width, height = A4
    y = height - 50

    c.setFont("Helvetica-Bold", 14)
    c.drawString(50, y, "Purchase Receipt")

    y -= 30
    c.setFont("Helvetica", 10)
    c.drawString(50, y, f"Phone: {phone}")
    y -= 20
    c.drawString(50, y, f"Date: {datetime.utcnow()}")

    y -= 30
    for it in items:
        text = f"{it['name']} x {it['quantity']} @ {it['unit_price']} = {it['subtotal']}"
        c.drawString(60, y, text)
        y -= 15

    y -= 10
    c.drawString(50, y, f"TOTAL: {total}")
    c.save()

    return path
