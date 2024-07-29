#!/bin/zsh

# Function to execute scripts based on file type
run_script() {
    local script_path="$1"
    
    # Check if script file exists
    if [ ! -f "$script_path" ]; then
        echo "File not found: $script_path"
        return 1
    fi

    # Get the file extension
    local extension="${script_path##*.}"

    # Execute the script based on its type
    case "$extension" in
        sh)
            echo "Running shell script ($script_path)..."
            bash "$script_path"
            ;;
        py)
            echo "Running Python script ($script_path)..."
            python3 "$script_path"
            ;;
        js)
            echo "Running JavaScript script ($script_path)..."
            node "$script_path"
            ;;
        rb)
            echo "Running Ruby script ($script_path)..."
            ruby "$script_path"
            ;;
        *)
            echo "Unsupported file type: $extension"
            return 1
            ;;
    esac
}

# Main script execution
if [ "$#" -ne 1 ]; then
    echo "Usage: run <script_path>"
    exit 1
fi

run_script "$1"
