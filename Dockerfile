FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libcairo2-dev \
    pkg-config \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Manim and JupyterLab
RUN pip install --no-cache-dir \
    manim \
    jupyterlab

# Create working directory
WORKDIR /home/jovyan

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]