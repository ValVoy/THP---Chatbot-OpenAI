# Chatbot OpenAI

Welcome to this project created as part of **The Hacking Project (THP)** bootcamp.
The goal is to master the OpenAI API "from scratch" in Ruby, by building raw HTTP requests to understand the inner workings of LLMs (Large Language Models).

## Prerequisites

* Ruby (version 3.0 or higher recommended)
* An OpenAI account with an active API Key
* Bundler

## Installation

1.  **Clone the repository** (if you haven't already):
    ```bash
    git clone <your-github-link>
    cd my_chatbot
    ```

2.  **Install the gems**:
    ```bash
    bundle install
    ```
    *This project uses `http` for requests, `json` for parsing, `dotenv` for security, and `pry` for debugging.*

3.  **Configure your API Key**:
    * Create a `.env` file at the root of the project.
    * Add your API key inside (never share this key!):
    ```text
    OPENAI_API_KEY=sk-your-secret-key-here
    ```

---

## Usage

The project is divided into 4 levels of increasing difficulty. All scripts are located in the `lib/` folder.

### 1. The Ice Cream Shop 
A bot capable of generating a list of ice cream flavors without repeating itself (no more "Vanilla" 5 times in a row!).
* **Technique:** Uses *Few-Shot Learning* (learning by example) to force the model to follow a specific list format.
* **Command:**
    ```bash
    ruby lib/chatbot-glace.rb
    ```

### 2. The Chef 
A bot that generates a random cooking recipe step-by-step.
* **Technique:** Manages `temperature` (creativity) to ensure recipes are original but coherent.
* **Command:**
    ```bash
    ruby lib/chatbot-cooking.rb
    ```

### 3. The Conversational Chatbot 
A real assistant you can actually talk to. It remembers what you said previously (context management).
* **Technique:**
    * Injects conversation history (`conversation_history`) into every request.
    * Uses the `stop` parameter to prevent the AI from speaking on behalf of the user.
    * Clean loop management using the "stop" keyword.
* **Command:**
    ```bash
    ruby lib/chatbot-chat.rb
    ```

### 4. The Labyrinth (Debug Tool) 
A tool designed to fix broken Ruby code.
* **How it works:**
    1.  Run the `chatbot-labyrinth.rb` script.
    2.  Paste broken code (e.g., typos, syntax errors).
    3.  The AI analyzes, explains the errors, and rewrites clean code.
* **The Result:** The `lib/labyrinth.rb` file contains the final corrected code (generating an ASCII maze).
* **Commands:**
    ```bash
    # To run the code fixer
    ruby lib/chatbot-labyrinth.rb

    # To view the result (the working maze)
    ruby lib/labyrinth.rb
    ```

---

## Security

The `.env` file is included in `.gitignore` to prevent leaking the API key on GitHub.
The code uses `Dotenv.load` at startup to securely load environment variables.

## Author

*Valentin Chéron*

*The Hacking Project 2026*
