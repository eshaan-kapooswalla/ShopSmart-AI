#!/bin/bash

# Create a new directory for the learning repository
mkdir -p learning-journey
cd learning-journey
git init

# Create initial repository structure
echo "# Learning Journey
This repository tracks my programming learning progress. It includes notes and code snippets.

## Structure
- **notes/**: Daily learning notes in Markdown
- **code/**: Code snippets and small projects
- **resources/**: Useful links and references" > README.md

mkdir -p notes code resources
echo "- [Python Official Tutorial](https://docs.python.org/3/tutorial/)" > resources/links.md
git add .
git commit -m "Initial commit: Set up learning repository" --date="2025-02-11T10:00:00"

# Function to generate random date between Feb 11, 2025, and Apr 11, 2025
generate_random_date() {
  start_seconds=$(date -j -f "%Y-%m-%d" "2025-02-11" "+%s")
  end_seconds=$(date -j -f "%Y-%m-%d" "2025-04-11" "+%s")
  random_seconds=$((start_seconds + RANDOM % (end_seconds - start_seconds)))
  random_date=$(date -j -f "%s" "$random_seconds" "+%Y-%m-%d")
  echo "$random_date"
}

# Track commit dates using a temporary file to avoid associative array
commit_dates_file=$(mktemp)

# Generate 20 commit dates with max 2 per day
dates=()
while [ ${#dates[@]} -lt 20 ]; do
  new_date=$(generate_random_date)
  count=$(grep -c "^$new_date$" "$commit_dates_file" || true)
  if [ "$count" -lt 2 ]; then
    echo "$new_date" >> "$commit_dates_file"
    dates+=("$new_date")
  fi
done

# Sort dates chronologically
IFS=$'\n' sorted_dates=($(sort "$commit_dates_file"))
unset IFS
rm "$commit_dates_file"

# Learning topics and corresponding code snippets
topics=(
  "Python Variables" "code/variables.py" "x = 10\nprint('Value:', x)"
  "Python Lists" "code/lists.py" "fruits = ['apple', 'banana']\nfruits.append('orange')\nprint(fruits)"
  "Python Loops" "code/loops.py" "for i in range(5):\n    print(i)"
  "Python Functions" "code/functions.py" "def greet(name):\n    return f'Hello, {name}!'\nprint(greet('Alice'))"
  "Python Dictionaries" "code/dictionaries.py" "scores = {'Alice': 90, 'Bob': 85}\nprint(scores['Alice'])"
  "Python Conditionals" "code/conditionals.py" "age = 20\nif age >= 18:\n    print('Adult')"
  "Python Strings" "code/strings.py" "text = 'Hello'\nprint(text.upper())"
  "Python File I/O" "code/file_io.py" "with open('test.txt', 'w') as f:\n    f.write('Hello')"
  "Python Classes" "code/classes.py" "class Dog:\n    def bark(self):\n        print('Woof!')"
  "Python Modules" "code/modules.py" "import math\nprint(math.sqrt(16))"
  "Bash Basics" "code/hello.sh" "echo 'Hello, World!'"
  "Bash Variables" "code/vars.sh" "name='Alice'\necho \$name"
  "Bash Conditionals" "code/conditionals.sh" "if [ 5 -gt 3 ]; then\n    echo 'True'\nfi"
  "Bash Loops" "code/loops.sh" "for i in {1..3}\ndo\n    echo \$i\ndone"
  "Python List Comprehension" "code/list_comp.py" "squares = [x**2 for x in range(5)]\nprint(squares)"
  "Python Error Handling" "code/try_except.py" "try:\n    print(1/0)\nexcept ZeroDivisionError:\n    print('Error')"
  "Python Sets" "code/sets.py" "unique = {1, 2, 2, 3}\nprint(unique)"
  "Python Tuples" "code/tuples.py" "point = (1, 2)\nprint(point[0])"
  "Bash Functions" "code/functions.sh" "greet() {\n    echo 'Hello, '\$1\n}\ngreet Alice"
  "Python Lambda Functions" "code/lambda.py" "square = lambda x: x**2\nprint(square(5))"
)

# Create commits with learning notes and code
for i in "${!sorted_dates[@]}"; do
  date=${sorted_dates[$i]}
  topic_index=$((i * 3))
  topic=${topics[$topic_index]}
  file=${topics[$topic_index + 1]}
  code=${topics[$topic_index + 2]}
  
  # Create a note
  echo "# $topic\nDate: $date\n\nLearned about $topic today. Key points:\n- Explored basic syntax\n- Practiced examples\n\nNext steps:\n- Apply $topic in a small project" > "notes/note_$((i+1)).md"
  
  # Create or update code file
  mkdir -p "$(dirname "$file")"
  echo -e "$code" > "$file"
  
  # Make shell scripts executable
  if [[ "$file" == *.sh ]]; then
    chmod +x "$file"
  fi
  
  # Commit with the specified date
  git add .
  GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" \
  git commit -m "Added $topic note and code" --date="$date"
done

echo "Learning repository with 20 commits created in 'learning-journey' directory!"
echo "To push to GitHub, run:"
echo "cd learning-journey"
echo "git remote add origin <your-repo-url>"
echo "git branch -M main"
echo "git push -u origin main"
