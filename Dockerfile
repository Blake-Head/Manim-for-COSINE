# Use a full Python image (not slim) to avoid missing build tools
FROM python:3.11

# Install system dependencies for pycairo
RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    pkg-config \
    python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Install manim via pip
RUN pip install --upgrade pip
RUN pip install manim jupyterlab

RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /home/jovyan

EXPOSE 8888

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]