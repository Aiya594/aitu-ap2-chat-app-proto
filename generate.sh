#!/usr/bin/env bash
# Run from the repo root: ./proto/generate.sh
# Requires: protoc, protoc-gen-go, protoc-gen-go-grpc
#
# Install tools:
#   go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
#   go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
#   brew install protobuf  (macOS) | apt install protobuf-compiler (Ubuntu)

# Run from proto folder: ./generate.sh

set -e

PROTO_DIR="."
OUT_DIR="./gen"

mkdir -p "$OUT_DIR/auth"
mkdir -p "$OUT_DIR/user"
mkdir -p "$OUT_DIR/chat"
mkdir -p "$OUT_DIR/notification"

echo "→ Generating auth.proto..."
protoc \
  --proto_path="$PROTO_DIR" \
  --go_out="$OUT_DIR/auth" --go_opt=paths=source_relative \
  --go-grpc_out="$OUT_DIR/auth" --go-grpc_opt=paths=source_relative \
  "$PROTO_DIR/auth.proto"

echo "→ Generating user.proto..."
protoc \
  --proto_path="$PROTO_DIR" \
  --go_out="$OUT_DIR/user" --go_opt=paths=source_relative \
  --go-grpc_out="$OUT_DIR/user" --go-grpc_opt=paths=source_relative \
  "$PROTO_DIR/user.proto"

echo "→ Generating chat.proto..."
protoc \
  --proto_path="$PROTO_DIR" \
  --go_out="$OUT_DIR/chat" --go_opt=paths=source_relative \
  --go-grpc_out="$OUT_DIR/chat" --go-grpc_opt=paths=source_relative \
  "$PROTO_DIR/chat.proto"

echo "→ Generating notification.proto..."
protoc \
  --proto_path="$PROTO_DIR" \
  --go_out="$OUT_DIR/notification" --go_opt=paths=source_relative \
  --go-grpc_out="$OUT_DIR/notification" --go-grpc_opt=paths=source_relative \
  "$PROTO_DIR/notification.proto"

echo "✓ Done. Generated files in $OUT_DIR/"