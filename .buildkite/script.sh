#!/bin/bash

echo "=== Starting Hello Application Script ==="

# Download the compiled binary
echo "Downloading the compiled binary..."
buildkite-agent artifact download "hello/hello" .

# Make it executable
echo "Setting executable permissions..."
chmod +x hello/hello

# Get user name from metadata
echo "Retrieving user name from metadata..."
USER_NAME=$(buildkite-agent meta-data get "release-name")

# Debug: Show what we retrieved
echo "Retrieved user name: '$USER_NAME'"

# Run the application
echo "Running the hello application..."
echo "Command: ./hello/hello \"$USER_NAME\""
./hello/hello "$USER_NAME"

echo "=== Script completed ==="
