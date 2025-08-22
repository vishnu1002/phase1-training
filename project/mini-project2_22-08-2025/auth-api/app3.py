from fastapi import FastAPI, Request, File, UploadFile
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
import shutil
import os

app = FastAPI()
templates = Jinja2Templates(directory="templates")

# Ensure the upload directory exists
os.makedirs("uploaded_files", exist_ok=True)

@app.get("/")
async def read_root():
    return {"message": "Welcome to FastAPI"}

@app.get("/upload", response_class=HTMLResponse)
async def upload_form(request: Request):
    return templates.TemplateResponse("upload.html", {"request": request, "message": None})

@app.post("/uploader", response_class=HTMLResponse)
async def upload_file_handler(request: Request, file: UploadFile = File(...)):
    file_path = f"uploaded_files/{file.filename}"
    with open(file_path, "wb") as f:
        shutil.copyfileobj(file.file, f)

    # Render the same template with success message
    return templates.TemplateResponse(
        "upload.html",
        {"request": request, "message": f"File uploaded successfully: {file.filename}"}
    )
