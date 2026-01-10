# 开源项目使用指南

## 📋 项目简介

本项目包含一系列用于金融数据分析的Python脚本，主要包括：

- A股市场数据分析
- 汇率数据获取
- 纳斯达克指数价格
- 加密货币价格
- 社交媒体搜索指数分析

## 📁 项目结构

```html
EdgeMan/
├── Catchweb_pre.ipynb           # Cookie 保存与登录管理
├── Catchweb_number.ipynb        # 网页数据读取（如IPO数据）
├── Catchweb_social.ipynb        # 社交搜索指数抓取（如知乎）
├── AAA.ipynb                    # A股指数分析
├── coin.ipynb                   # 加密货币数据（Binance）
├── exch.ipynb                   # 汇率数据（Yahoo Finance）
├── nasdaq.ipynb                 # 纳斯达克指数分析
├── Papermill.ipynb              # 批量执行工具（支持并行）
├── Papermill_number.ipynb       # 批量执行工具（顺序执行）
├── file_utils.ipynb             # CSV 文件清洗与迁移工具
├── requirements.txt             # Python 依赖包列表
├── Makefile                     # 常用命令快捷方式
├── CHANGELOG.md                 # 版本更新日志
├── CONTRIBUTING.md              # 贡献指南
├── QUICKSTART.md                # 快速使用指南
├── fileDescription.md           # 文件功能说明
└── README.md                    # 项目说明（本文档）
```

## 🔧 快速开始

### 1. 环境要求

```bash
Edgedriver lastversion
Python 3.8+
Jupyter Notebook
```

### 1.1. 原始开发环境

```bash
Edgedriver 143.0.3650.66
WSL2/Ubuntu 20.04
Python 3.10.12
Selenium 4.24.0
ipykernel 6.30.1
```

### 2. 安装依赖

```bash
pip install -r requirements.txt
```

### 3. 配置环境

#### 方式一：直接修改（目前推荐）

由于都是通过VibeCoding一点点增加的代码和功能，

之前没有项目规划，手动填写比较直接，可以做的是，

在相应的notebook文件中，将占位符替换为您的实际配置：

```python
# 示例：在 coin.ipynb 中
api_key = "YOUR_API_KEY_HERE"  # 改为您的Binance API密钥
api_secret = "YOUR_API_SECRET_HERE"  # 改为您的Binance API密钥
```

#### 方式二：环境变量（待更新）

也可以自行创建，只需要简单几步设置环境变量即可

1. 创建 `.env` 文件：

```bash
# Binance API
BINANCE_API_KEY=your_actual_api_key
BINANCE_API_SECRET=your_actual_api_secret

# 代理设置
PROXY_HOST=your_proxy_host
PROXY_PORT=your_proxy_port
```

2. 在notebook中使用：

```python
import os
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv('BINANCE_API_KEY')
api_secret = os.getenv('BINANCE_API_SECRET')
```

## 📁 文件说明

### 数据获取类

| 文件 | 功能 | 数据来源 | 需要配置 |
|------|------|----------|----------|
| AAA.ipynb | A股指数分析 | akshare | 无 |
| coin.ipynb | 加密货币分析 | Binance | API密钥 |
| exch.ipynb | 汇率分析 | Yahoo Finance | 无 |
| nasdaq.ipynb | 纳斯达克分析 | akshare | 无 |

### 网页抓取类

| 文件 | 功能 | 目标网站 | 需要配置 |
|------|------|----------|----------|
| Catchweb_pre.ipynb | Cookie保存 | tools.zhihu.com | IP地址、URL |
| Catchweb_social.ipynb | 搜索指数读取 | tools.zhihu.com | IP地址、URL |
| Catchweb_number.ipynb | 网页数据读取 | cfi.cn | IP地址 |

### 工具类

| 文件 | 功能 | 说明 |
|------|------|------|
| file_utils.ipynb | 文件处理工具 | CSV清洗和迁移 |
| Papermill.ipynb | 批量执行工具 | 执行api数据抓取 |
| Papermill_number.ipynb | 批量执行工具 | 执行Catchweb网页读取 |

## 🚀 使用方法

### 批量执行

在单个文件修改，或者环境变量设置好后，使用papermill批量执行
都是在jupyter里手动点击完成的

## ⚠️ 注意事项

1. API限制
   - 注意各API的调用频率限制
   - 建议添加适当的延时（如 time.sleep()）

2. 数据存储
   - 默认数据保存在当前目录

3. Edge连接
   - Windows系统中要首先配置好Edgedriver
   - 通过Catchweb_pre.ipynb首先完成Cookies存储
   - Cookies容易过期，要及时检查

4. 错误处理
   - 各脚本已包含基本的异常处理
   - 建议根据实际需求增强错误处理逻辑

5. 隐私安全
   - 不要将包含实际密钥的文件提交到版本控制
   - 使用 .gitignore 忽略敏感文件
   - 定期轮换API密钥

## 🔒 安全配置示例

### .gitignore

```gitignore
# 配置文件
config/config.py
.env
*.env

# 数据文件
data/*.csv
*.csv

# 密钥文件
*.key
*.pem
*.p12

# 临时文件
*.tmp
*.log
.DS_Store
__pycache__/
```

## 📝 许可证

本项目采用 MIT 许可证 - 查看 LICENSE 文件了解详情。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📚 参考资料

- [EdgeDriver](https://developer.microsoft.com/en-us/microsoft-edge/?form=MA13LH)
- [Jupyter Notebook文档](https://jupyter.org/documentation)
- [akshare文档](https://www.akshare.xyz/)
- [Binance API文档](https://binance-docs.github.io/apidocs/spot/cn/)
- [Yahoo Finance](https://finance.yahoo.com/)

---

注意：使用本项目前，请确保您已阅读并同意相关API服务的使用条款。
