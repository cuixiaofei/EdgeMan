# EdgeMan – 基于 Edge 的金融数据抓取与分析工具
## EdgeMan – Financial Data Scraping and Analysis Tool Based on Edge

![License](https://img.shields.io/badge/license-GPLv3-yellow.svg)
![Python](https://img.shields.io/badge/python-3.8%2B-blue)
![Platform](https://img.shields.io/badge/platform-WSL2%2FUbuntu%20%7C%20Windows-lightgrey)
![Browser](https://img.shields.io/badge/browser-Edge-0078D4.svg)

EdgeMan 是一个基于 **Microsoft Edge 浏览器** 与 **Selenium** 的自动化金融数据采集与分析项目，内置多类数据抓取脚本，支持 A 股、加密货币、汇率、纳斯达克指数以及社交平台搜索指数等数据源的自动化获取与处理。
EdgeMan is an automated financial data collection and analysis project based on **Microsoft Edge browser** and **Selenium**. It comes with multiple data scraping scripts and supports automatic acquisition and processing of various data sources, including A-shares, cryptocurrencies, exchange rates, NASDAQ indexes, and social media search indexes.

---

## ✨ 主要功能
## ✨ Key Features

- **Cookie 自动管理** – 通过 Edge 自动登录并保存会话，支持后续脚本调用
- **多源数据采集** – 支持 A 股、加密货币、汇率、纳斯达克等金融数据
- **社交指数抓取** – 可获取知乎等平台的搜索指数数据
- **批量执行支持** – 通过 Papermill 实现 Notebook 的批量与并行执行
- **数据清洗工具** – 内置 CSV 文件清洗与迁移工具
- **隐私安全检查** – 提供隐私信息泄露检测脚本，保护敏感数据
- **Automated Cookie Management** – Automatically log in via Edge and save sessions for subsequent script calls
- **Multi-source Data Collection** – Supports financial data such as A-shares, cryptocurrencies, exchange rates, and NASDAQ indexes
- **Social Index Scraping** – Can obtain search index data from platforms like Zhihu
- **Batch Execution Support** – Batch and parallel execution of Notebooks via Papermill
- **Data Cleaning Tools** – Built-in CSV file cleaning and migration tools
- **Privacy and Security Checks** – Provides scripts for detecting privacy information leaks to protect sensitive data

---

## 📈 使用示例
## 📈 Usage Examples

### 抓取 A 股指数数据
### Scrape A-share Index Data

运行 `AAA.ipynb`，自动获取上证指数并生成价格走势图。
Run `AAA.ipynb` to automatically obtain the SSE index and generate a price trend chart.

### 社交指数监控
### Social Index Monitoring

通过 `Catchweb_social.ipynb` 定期抓取知乎搜索指数，支持关键词跟踪与趋势分析。
Regularly scrape Zhihu search indexes via `Catchweb_social.ipynb`, with support for keyword tracking and trend analysis.

### 批量执行数据更新
### Batch Data Update Execution

使用 `Papermill.ipynb` 可并行执行多个数据采集脚本，适用于定时数据更新任务。
Use `Papermill.ipynb` to parallelly execute multiple data collection scripts for scheduled data update tasks.

---

## 📈 结果示例
## 📈 Example Results

### 文件内示例展示
### Example Demonstrations in Files

每个 Jupyter 笔记本文件中，还保留着之前运行成功时的显示结果，包括表格和图片。
Each Jupyter notebook file retains the display results from previous successful runs, including tables and images.

### 示例数据
### Example Data

整个项目的数据抓取过程，还有脚本功能，都进行了测试。
The entire project's data scraping process and script functions have been tested.

测试成功后，数据在 `example_data` 文件夹中完整保存了一份。
After successful testing, the data is fully saved in the `example_data` folder.

### 功能示例
### Function Examples

已经编写几个脚本辅助项目内的一些操作。
Several scripts have been written to assist with some project operations.

包括，调用 Edgedriver 的脚本，开发环境检查的脚本。
Including scripts for invoking Edgedriver and checking the development environment.

---

### 安装步骤
### Installation Steps

1. **环境检查**
1. **Environment Check**

   项目文件里有开发环境的检查脚本，同时在 `example_env` 里显示了最初的开发环境情况。
   The project files contain scripts for checking the development environment, and the initial development environment is shown in `example_env`.

2. **克隆仓库**
2. **Clone Repository**

   ```bash
   git clone https://github.com/yourusername/EdgeMan.git
   cd EdgeMan
   ```

3. **安装依赖**
3. **Install Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **配置 EdgeDriver**
4. **Configure EdgeDriver**

   - 下载并配置 Edgedriver，确保与本地 Edge 浏览器版本匹配
   - 将驱动路径加入系统环境变量
   - Download and configure Edgedriver to match the local Edge browser version
   - Add the driver path to the system environment variables

5. **运行 Cookie 初始化**
5. **Run Cookie Initialization**

   - 打开 `Catchweb_pre.ipynb`，按提示登录目标网站（如知乎工具页）
   - 脚本将自动保存 Cookie 供后续脚本使用
   - Open `Catchweb_pre.ipynb` and log in to the target website (e.g., Zhihu tool page) as instructed
   - The script will automatically save cookies for subsequent use by other scripts

---

## ⚙️ 配置说明
## ⚙️ Configuration Instructions

### 方式一：直接修改脚本（推荐初试）
### Method 1: Directly Modify the Script (Recommended for First-Time Use)

在对应的 `.ipynb` 文件中找到配置段，直接替换为你的信息：
Find the configuration section in the corresponding `.ipynb` file and replace it with your information:

```python
# 示例：coin.ipynb
# Example: coin.ipynb
api_key = "YOUR_BINANCE_API_KEY"
api_secret = "YOUR_BINANCE_API_SECRET"
```

### 方式二：环境变量（安全推荐）
### Method 2: Environment Variables (Secure Recommendation)

1. 创建 `.env` 文件：
1. Create a `.env` file:

   ```bash
   BINANCE_API_KEY=your_key
   BINANCE_API_SECRET=your_secret
   PROXY_HOST=your_proxy
   PROXY_PORT=your_port
   ```

2. 在 Notebook 中加载：
2. Load it in the Notebook:

   ```python
   import os
   from dotenv import load_dotenv
   load_dotenv()
   api_key = os.getenv('BINANCE_API_KEY')
   ```

---

## 🔐 隐私与安全建议
## 🔐 Privacy and Security Recommendations

- 不要在代码中硬编码 API 密钥、Cookie 等敏感信息
- 使用 `.gitignore` 忽略 `.env`、`*.csv`、`config/` 等本地文件
- 定期更新 Cookie 与 API 密钥
- 运行前可使用项目内置的 `privacy_checker` 进行敏感信息扫描
- Do not hardcode API keys, cookies, or other sensitive information in your code
- Use `.gitignore` to ignore local files such as `.env`, `*.csv`, and `config/`
- Regularly update cookies and API keys
- Before running, use the built-in `privacy_checker` to scan for sensitive information

示例 `.gitignore`：
Example `.gitignore`:

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
## 🤝 How to Contribute

我们欢迎 Issue 报告、功能建议和 Pull Request！
We welcome Issue reports, feature suggestions, and Pull Requests!

请先阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解贡献流程与规范。
Please read [CONTRIBUTING.md](CONTRIBUTING.md) to understand the contribution process and guidelines.

---

## 📄 许可证
## 📄 License

本项目基于 GPLv3 许可证开源。
This project is open-sourced under the GPLv3 license.

---

## 📚 参考资源
## 📚 Reference Resources

- [EdgeDriver 官方文档](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
- [akshare 数据接口](https://www.akshare.xyz/)
- [Binance API 文档](https://binance-docs.github.io/apidocs/spot/cn/)
- [Yahoo Finance](https://finance.yahoo.com/)
- [Jupyter Notebook 文档](https://jupyter.org/documentation)

---

## ❤️ 致谢
## ❤️ Acknowledgments

感谢所有为本项目提供代码、反馈与建议的贡献者。
Thank you to all contributors who have provided code, feedback, and suggestions for this project.

如果你觉得这个项目有用，欢迎 Star ⭐ 和 Fork!
If you find this project useful, feel free to Star ⭐ and Fork it!

---

> **免责声明**：本项目仅供学习与技术交流使用。使用者应遵守相关网站的服务条款与法律法规，禁止用于非法或侵权用途。
> **Disclaimer**: This project is intended for learning and technical交流 only. Users should comply with the service terms and laws and regulations of relevant websites and must not use it for illegal or infringing purposes.
