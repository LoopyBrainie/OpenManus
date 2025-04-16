FROM python:3.12

# 从 ghcr.io/astral-sh/uv:latest 镜像中复制 uv 可执行文件到 /usr/local/bin/
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/

# 确保 uv 具有可执行权限
RUN chmod +x /usr/local/bin/uv

# 设置工作目录
WORKDIR /dockerbox

# 创建虚拟环境
RUN uv venv --python 3.12

# 将虚拟环境路径添加到 PATH
ENV PATH="/dockerbox/.venv/bin:$PATH"

# 将当前目录下的所有文件复制到工作目录
COPY . .

# 安装项目依赖
RUN uv pip install -r requirements.txt

# 启动应用
CMD ["python", "main.py"]
