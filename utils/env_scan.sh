#!/usr/bin/env bash
# 保存为 scan-env.sh 然后 bash scan-env.sh
set -e

# ---------- 1. Python 顶层依赖（最小列表） ----------
pip freeze | grep -v "file://" | sed 's/==.*$//' > requirements.txt

# ---------- 2. 完整依赖（含子依赖，pip-tools 方式） ----------
pip install pip-tools 2>/dev/null || true
pip-compile --generate-hashes --allow-unsafe -o requirements-full.txt 2>/dev/null || pip freeze > requirements-full.txt

# ---------- 3. Jupyter 内核与扩展 ----------
jupyter kernelspec list | sed 's|/.*/|/path/to/|' > jupyter-kernels.txt
jupyter extension list > jupyter-extensions.txt 2>&1 || jupyter server extension list > jupyter-extensions.txt 2>&1

# ---------- 4. Conda 环境（若使用） ----------
if command -v conda &> /dev/null; then
    conda env export | sed 's/prefix:.*//'> environment.yml
fi

# ---------- 5. 扫描潜在的隐私文件 ----------
# echo "==== 隐私文件扫描（供检查）====" > sensitive-scan.txt
# find . -type f -name "*.env" -o -name "*config*" -o -name "*secret*" | head -20 | sed "s|$HOME|\~|g" >> sensitive-scan.txt
# 已经改为使用privacy-checker工具，进行目录扫描，生成报告命名为 privacy-report.txt

# ---------- 6. 生成 .gitignore 片段 ----------
cat <<EOF >> .gitignore
# 隐私/本地文件
.env
.cookies
.example_data
*config*local*
*secret*
*.key
*.pem
*.csv
EOF

echo "✅ 扫描完成，下列文件已生成："
ls -l requirements.txt requirements-full.txt jupyter-*.txt environment.yml 2>/dev/null