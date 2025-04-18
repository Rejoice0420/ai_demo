import requests
import json
import time

url = "http://localhost:11434/api/generate"
headers = {"Content-Type": "application/json"}

model1 = "llama3"
model2 = "gemma3:1b"

message = "Hello, who are you?"
num_turns = 6

for turn in range(num_turns):
    current_model = model1 if turn % 2 == 0 else model2
    print(f"\n--- Turn {turn + 1} ({current_model}) ---")

    data = {
        "model": current_model,
        "prompt": message,
        "stream": False
    }

    try:
        response = requests.post(url, headers=headers, data=json.dumps(data))
        response.raise_for_status()
        message = response.json().get("response", "").strip()
        print(f"{current_model}: {message}")
        time.sleep(1)
    except requests.exceptions.RequestException as e:
        print("Error:", e)
        break
