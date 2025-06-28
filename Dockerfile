FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]


# docker build -t contact-api .
# docker run -d -p 5000:5000 contact-api
# curl -X POST http://localhost:5000/contacts \
#     -H "Content-Type: application/json" \
#     -d '{"name": "Samir", "email": "samir@example.com", "phone": "1234567890"}'
