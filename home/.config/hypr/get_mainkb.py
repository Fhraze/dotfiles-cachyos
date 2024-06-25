import re
import json
import subprocess

command_run = subprocess.run("hyprctl devices -j | jq -r '.keyboards[]'", shell=True, capture_output=True, text=True)
command_out = command_run.stdout.strip()

# Step 1: Convert the multiline string to a list of individual JSON objects
command_out = command_out.strip().split('\n}\n{')
command_out = ['{' + item.strip('{}') + '}' for item in command_out]

# Step 2: Convert the list of JSON objects to a single JSON array string
command_out_json = '[\n  ' + ',\n  '.join(command_out) + '\n]'

# Parse the JSON input
data = json.loads(command_out_json)

# Find the keyboard with "main": true
main_keyboard = next((item["name"] for item in data if item["main"]), None)

# Print the name of the main keyboard
print(main_keyboard, end="")
