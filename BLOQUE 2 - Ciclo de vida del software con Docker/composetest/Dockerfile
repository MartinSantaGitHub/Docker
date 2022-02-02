FROM python:3.7-alpine

# Work directory creation
WORKDIR /code

# Env Variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers

# Copy files
COPY . .

# Dependencies installation
RUN pip install -r requirements.txt

# Expose a port
EXPOSE 5000

# Execute
CMD ["flask", "run"]