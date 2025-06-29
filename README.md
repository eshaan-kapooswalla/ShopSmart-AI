# 🛍️ ShopSmart AI - Intelligent E-commerce Recommender

<div align="center">
  <p>Powered by Machine Learning • Built with Flask • Personalized Shopping Experience</p>
  <img src="https://img.shields.io/badge/Python-3.7%2B-blue" alt="Python 3.7+">
  <img src="https://img.shields.io/badge/Flask-2.0.1-green" alt="Flask 2.0.1">
  <img src="https://img.shields.io/badge/MySQL-8.0-blue" alt="MySQL 8.0">
  <img src="https://img.shields.io/badge/License-MIT-yellow" alt="MIT License">
</div>

## 📋 Table of Contents
- [Overview](#-overview)
- [Key Features](#-key-features)
- [Tech Stack](#-tech-stack)
- [Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#-installation)
  - [Configuration](#-configuration)
- [Project Structure](#-project-structure)
- [Usage Guide](#-usage-guide)
- [API Endpoints](#-api-endpoints)
- [Machine Learning Model](#-machine-learning-model)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)
- [Acknowledgments](#-acknowledgments)

## 🌟 Overview

ShopSmart AI revolutionizes online shopping with intelligent, personalized product recommendations. Our system analyzes user behavior and product attributes to suggest items that match individual preferences, enhancing the shopping experience and increasing engagement.

## ✨ Key Features

- **AI-Powered Recommendations**
  - Content-based filtering for similar product suggestions
  - Real-time personalized recommendations
  - Trending products discovery

- **User Experience**
  - Clean, responsive interface
  - Secure authentication system
  - Intuitive product search
  - Interactive product browsing

- **Admin Features**
  - Product management
  - User analytics
  - Recommendation performance tracking

## 🛠️ Tech Stack

| Category       | Technologies                                  |
|----------------|-----------------------------------------------|
| **Backend**    | Python, Flask, Flask-SQLAlchemy               |
| **Frontend**   | HTML5, CSS3, JavaScript, Bootstrap 5          |
| **Database**   | MySQL                                         |
| **ML**         | scikit-learn, pandas, NumPy                   |
| **Deployment** | Local development (Flask built-in server)     |

## 🚀 Getting Started

### Prerequisites
- Python 3.7 or higher
- MySQL Server 8.0+
- pip (Python package manager)
- Git (for version control)

### 💻 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ShopSmart-AI.git
   cd ShopSmart-AI
   ```

2. **Set up a virtual environment**
   ```bash
   # For Windows
   python -m venv venv
   .\venv\Scripts\activate
   
   # For macOS/Linux
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

### ⚙️ Configuration

1. **Database Setup**
   ```sql
   CREATE DATABASE ecom;
   ```

2. **Update Configuration**
   Modify `app.py` with your database credentials if needed:
   ```python
   app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:password@localhost/ecom'
   ```

3. **Run Migrations**
   ```bash
   flask db upgrade
   ```

4. **Start the Application**
   ```bash
   python app.py
   ```

5. **Access the Application**
   Open your browser and navigate to:
   ```
   http://localhost:5000
   ```

## 📁 Project Structure

```
ShopSmart-AI/
├── app.py                 # Main application entry point
├── config.py              # Configuration settings
├── requirements.txt       # Python dependencies
├── README.md              # Project documentation
├── static/                # Static files
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript files
│   └── img/              # Image assets
├── templates/             # HTML templates
│   ├── base.html         # Base template
│   ├── index.html        # Home page
│   ├── auth/             # Authentication templates
│   └── products/         # Product-related templates
└── models/               # Data models and ML components
    ├── clean_data.csv    # Processed product data
    └── trending_products.csv  # Trending items data
```

## 🖥️ Usage Guide

1. **Registration & Login**
   - Create a new account or log in with existing credentials
   - Secure password hashing ensures data protection

2. **Browsing Products**
   - View trending products on the homepage
   - Click on products for detailed information
   - Use the search functionality to find specific items

3. **Getting Recommendations**
   - The system analyzes your interactions
   - Personalized recommendations appear on your dashboard
   - Discover new products based on your preferences

## 🤖 Machine Learning Model

Our recommendation system uses:

- **Content-Based Filtering**
  - TF-IDF vectorization for product descriptions
  - Cosine similarity for finding similar items
  - Product feature extraction and analysis

```python
def get_recommendations(product_id, num_recommendations=5):
    # TF-IDF Vectorization
    tfidf = TfidfVectorizer(stop_words='english')
    tfidf_matrix = tfidf.fit_transform(products['description'])
    
    # Calculate cosine similarity
    cosine_sim = cosine_similarity(tfidf_matrix, tfidf_matrix)
    
    # Get recommendations
    idx = product_id_to_index[product_id]
    sim_scores = list(enumerate(cosine_sim[idx]))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)
    sim_scores = sim_scores[1:num_recommendations+1]
    
    return [index_to_product_id[i[0]] for i in sim_scores]
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



## 👤 Author

**eshaan**  
 
- Email: eshaank@my.yorku.ca
-
## 🙏 Acknowledgments

- Dataset provided by Walmart e-commerce
- Flask and scikit-learn documentation
- Open-source community for invaluable tools and libraries
- All contributors who helped improve this project

---
