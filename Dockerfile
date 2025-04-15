FROM python:3.12

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN uv venv --python 3.12


WORKDIR /dockerbox

COPY ./ ./dockerbox

RUN ./venv/scripts/activate
RUN uv pip install -r requirements.txt

CMD ["python", "main.py"]
