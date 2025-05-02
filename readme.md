# 🛠️ AliExpress Automation Test Suite using Robot Framework

This repository contains automated UI tests for the [AliExpress](https://www.aliexpress.com/) website using **Robot Framework** with **SeleniumLibrary**. It includes functional test scenarios like searching products, switching currencies, adding to cart, and verifying UI elements.

---

## 🚀 Getting Started (Local Setup)

Follow these steps to set up the project locally and start running tests:

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/HossamAhmedFouad/RobotFramework-Automated-Testing.git
cd RobotFramework-Automated-Testing
```

### 2️⃣ Set Up a Python Virtual Environment

```bash
python -m venv venv
# Activate the environment:
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

### 3️⃣ Install Dependencies

After activating the environment install the required packages using:

```bash
pip install -r requirements.txt
```

> ⚠️ Make sure you have [Google Chrome](https://www.google.com/chrome/) installed, and the [ChromeDriver](https://chromedriver.chromium.org/downloads) version matches your Chrome browser.

---

### 4️⃣ Install VS Code Extensions (Optional but Recommended)

To enable syntax highlighting and code suggestions:

- 📦 **Robot Framework Language Server**
- 📦 **RobotCode – Robot Framework Support**

Search and install these extensions from the VS Code marketplace.

---

## 🧪 Running the Tests

You can run the test suite using the following command:

```bash
robot .
```

To run a specific test case or file:

```bash
robot -t "Scenario Six" robot-tests/TestSuite.robot
```

Or:

```bash
robot robot-tests/TestSuite.robot
```

---

## ✏️ Editing & Writing Tests

- All test scenarios are defined in the `tests.robot` file.
- Update the test case bodies under `*** Test Cases ***` as needed.
- Modify test values under `*** Variables ***` at the top of the file.
- Add or update custom keywords under the `*** Keywords ***` section.
