# EdgeMan – 基于Edge的金融数据抓取与分析工具

![License](https://img.shields.io/badge/license-GPLv3-yellow.svg)
![Python](https://img.shields.io/badge/python-3.8%2B-blue)
![Platform](https://img.shields.io/badge/platform-WSL2%2FUbuntu%20%7C%20Windows-lightgrey)
![Browser](https://img.shields.io/badge/browser-Edge-0078D4.svg)

EdgeMan 是一个基于 **Microsoft Edge 浏览器** 与 **Selenium** 的自动化金融数据采集与分析项目，内置多类数据抓取脚本，支持A股、加密货币、汇率、纳斯达克指数以及社交平台搜索指数等数据源的自动化获取与处理。

---

## ✨ 主要功能

- **Cookie 自动管理** – 通过 Edge 自动登录并保存会话，支持后续脚本调用
- **多源数据采集** – 支持 A 股、加密货币、汇率、纳斯达克等金融数据
- **社交指数抓取** – 可获取知乎等平台的搜索指数数据
- **批量执行支持** – 通过 Papermill 实现 Notebook 的批量与并行执行
- **数据清洗工具** – 内置 CSV 文件清洗与迁移工具
- **隐私安全检查** – 提供隐私信息泄露检测脚本，保护敏感数据

---

## 📈 使用示例

### 抓取A股指数数据

运行 `AAA.ipynb`，自动获取上证指数并生成价格走势图。

### 社交指数监控

通过 `Catchweb_social.ipynb` 定期抓取知乎搜索指数，支持关键词跟踪与趋势分析。

### 批量执行数据更新

使用 `Papermill.ipynb` 可并行执行多个数据采集脚本，适用于定时数据更新任务。

---

## 📈 结果示例

### 文件内示例展示

每个jupyter笔记本文件中，还保留着之前运行成功时的显示结果，包括表格和图片

### 示例数据

整个项目的数据抓取过程，还有脚本功能，都进行了测试。

测试成功后，数据在example_data文件夹中完整保存了一份

### 功能示例

已经编写几个脚本辅助项目内的一些操作

包括，调用Edgedriver的脚本，开发环境检查的脚本

---

### 安装步骤

1. **环境检查**

   项目文件里有开发环境的检查脚本，同时在example_env里显示了最初的开发环境情况

2. **克隆仓库**

   ```bash
   git clone https://github.com/yourusername/EdgeMan.git
   cd EdgeMan
   ```

3. **安装依赖**

   ```bash
   pip install -r requirements.txt
   ```

4. **配置 EdgeDriver**
   - 下载并配置 Edgedriver，确保与本地 Edge 浏览器版本匹配
   - 将驱动路径加入系统环境变量

5. **运行 Cookie 初始化**
   - 打开 `Catchweb_pre.ipynb`，按提示登录目标网站（如知乎工具页）
   - 脚本将自动保存 Cookie 供后续脚本使用

---

## ⚙️ 配置说明

### 方式一：直接修改脚本（推荐初试）

在对应的 `.ipynb` 文件中找到配置段，直接替换为你的信息：

```python
# 示例：coin.ipynb
api_key = "YOUR_BINANCE_API_KEY"
api_secret = "YOUR_BINANCE_API_SECRET"
```

### 方式二：环境变量（安全推荐）

1. 创建 `.env` 文件：

   ```bash
   BINANCE_API_KEY=your_key
   BINANCE_API_SECRET=your_secret
   PROXY_HOST=your_proxy
   PROXY_PORT=your_port
   ```

2. 在 Notebook 中加载：

   ```python
   import os
   from dotenv import load_dotenv
   load_dotenv()
   api_key = os.getenv('BINANCE_API_KEY')
   ```

---

## 🔐 隐私与安全建议

- 不要在代码中硬编码 API 密钥、Cookie 等敏感信息
- 使用 `.gitignore` 忽略 `.env`、`*.csv`、`config/` 等本地文件
- 定期更新 Cookie 与 API 密钥
- 运行前可使用项目内置的 `privacy_checker` 进行敏感信息扫描

示例 `.gitignore`：

```gitignore
.env
*.csv
data/
config/
*.log
__pycache__/
```

---

## 🤝 如何贡献

我们欢迎 Issue 报告、功能建议和 Pull Request！  
请先阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解贡献流程与规范。

---

## 📄 许可证

本项目基于 GPLv3 许可证开源。  

---

## 📚 参考资源

- [EdgeDriver 官方文档](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
- [akshare 数据接口](https://www.akshare.xyz/)
- [Binance API 文档](https://binance-docs.github.io/apidocs/spot/cn/)
- [Yahoo Finance](https://finance.yahoo.com/)
- [Jupyter Notebook 文档](https://jupyter.org/documentation)

---

## ❤️ 致谢

感谢所有为本项目提供代码、反馈与建议的贡献者。  
如果你觉得这个项目有用，欢迎 Star ⭐ 和 Fork！

---

> **免责声明**：本项目仅供学习与技术交流使用。使用者应遵守相关网站的服务条款与法律法规，禁止用于非法或侵权用途。
