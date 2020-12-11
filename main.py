from pathlib import Path
from typing import Optional

from fastapi import FastAPI
from fairseq.models.transformer import TransformerModel
import os


if "NS_NMT_MODEL_DIR" in os.environ:
    models_dir = Path(os.environ["NS_NMT_MODEL_DIR"])
    model = TransformerModel.from_pretrained(
      str(models_dir),
      checkpoint_file='model.pt',
      bpe_codes=str(models_dir / "bpecodes")
    )
    model.eval()

app = FastAPI()


@app.get("/health")
def health():
    return {"status": 1, "message": "I am alive"}


@app.get("/translate/")
def translate(q: Optional[str] = None):
    return {"q": q, "translated_text": model.translate(q)}
