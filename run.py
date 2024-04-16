from app import create_app
from dotenv import load_dotenv
import os

load_dotenv()
app = create_app()

if __name__ == '__main__':
    app.run(debug=False, port=8080, host='0.0.0.0')