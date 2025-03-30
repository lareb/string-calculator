# 🧮 String Calculator API (Sinatra)

A simple **String Calculator API** built using **Sinatra** and developed following **Test-Driven Development (TDD)** principles. The API accepts a string of numbers (with different delimiters) and returns the sum.

## 🌟 Features
- Accepts comma-separated numbers and calculates their sum.
- Supports new-line (`\n`) as a delimiter.
- Supports custom delimiters (e.g., `//;\n1;2` → `3`).
- Throws an error if negative numbers are provided.
- Developed using **Sinatra** and **RSpec** for TDD.

---

## 🚀 Setup Instructions (Local Development)

### **1️⃣ Prerequisites**
Make sure you have the following installed on your machine:
- **Ruby** (>= 3.0)
- **Bundler** (`gem install bundler`)

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/lareb/string-calculator.git
cd string_calculator
```
### **3️⃣ Install Dependenciesy**

```sh
bundle install
```
### **4️⃣ Run the Sinatra Servery**

```
ruby app.rb
```
By default, the server will run on:
➡️ http://localhost:4567

### **📡 API Usage**
##### **📝 Endpoint: /calculate**
**Method: POST**
**Content-Type: application/json**
**Body Example:**
```
{ "numbers": "1,2,3" }
````
**Response Example:**
```
{ "result": 6 }
```
### **✅ Supported Inputs**

```
| Input           | Output                                         |
|----------------|-------------------------------------------------|
| `""`           | `0`                                             |
| `"1"`          | `1`                                             |
| `"1,5"`        | `6`                                             |
| `"1,2,3,4,5"`  | `15`                                            |
| `"1\n2,3"`     | `6`                                             |
| `"//;\n1;2"`   | `3`                                             |
| `"1,-2,3,-4"`  | `Error: "negative numbers not allowed: -2, -4"` |

```

### **🧪 Running Tests**
To run tests using RSpec, use:
```
rspec
```

### **🌍 Deployment (Render)**

This API is deployed on Render.
Live URL: https://string-calculator-m3iv.onrender.com

Testing Live API
```
curl -X POST https://string-calculator-m3iv.onrender.com/calculate -H "Content-Type: application/json" -d '{"numbers": "1,2,3"}'
```

### **📜 Project Structure**

```
/string_calculator
│── app.rb          # Main Sinatra application
│── Gemfile         # Dependencies
│── Gemfile.lock    # Bundled gems
│── Procfile        # Web server configuration (for Render)
│── config/
│   ├── puma.rb     # Puma web server config (optional)
│── spec/           # Test cases using RSpec
│   ├── string_calculator_spec.rb
│── README.md       # Project documentation
```

### **🛠️ Technologies Use**d
- Ruby (Sinatra)
- RSpec for testing
- Puma as the web server
- Render for deployment

### **🤝 Contributing**
Feel free to contribute by submitting pull requests or reporting issues.

### **📝 License**
This project is licensed under the MIT License.
