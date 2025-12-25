#!/usr/bin/env bash

set -e

if [ "$(uname)" == "Darwin" ]; then
  # macOS installation using Homebrew
  if command -v brew >/dev/null 2>&1; then
    echo "Installing DuckDB via Homebrew..."
    brew install duckdb
  else
    echo "Homebrew not found. Installing DuckDB manually..."
    curl -L https://github.com/duckdb/duckdb/releases/latest/download/duckdb_cli-osx-universal.zip -o /tmp/duckdb.zip
    unzip -o /tmp/duckdb.zip -d /tmp/
    sudo mv /tmp/duckdb /usr/local/bin/
    rm /tmp/duckdb.zip
  fi
elif [ "$(uname)" == "Linux" ]; then
  # Linux installation
  echo "Installing DuckDB on Linux..."
  
  # Check architecture
  ARCH=$(uname -m)
  if [ "$ARCH" == "x86_64" ]; then
    DUCKDB_ARCH="amd64"
  elif [ "$ARCH" == "aarch64" ]; then
    DUCKDB_ARCH="aarch64"
  else
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi
  
  # Download and install DuckDB CLI
  curl -L "https://github.com/duckdb/duckdb/releases/latest/download/duckdb_cli-linux-${DUCKDB_ARCH}.zip" -o /tmp/duckdb.zip
  unzip -o /tmp/duckdb.zip -d /tmp/
  sudo mv /tmp/duckdb /usr/local/bin/
  rm /tmp/duckdb.zip
  
  echo "DuckDB installed successfully"
else
  echo "Unsupported operating system"
  exit 1
fi

# Verify installation
if command -v duckdb >/dev/null 2>&1; then
  echo "DuckDB installation verified:"
  duckdb --version
else
  echo "DuckDB installation failed"
  exit 1
fi