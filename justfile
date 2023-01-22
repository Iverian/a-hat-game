# Use with https://github.com/casey/just

# list commands
default:
  @just --list

# Generate gRPC code
grpc-gen:
  protoc --dart_out=grpc:{{ justfile_directory() }}/lib/src/generated -Iprotos {{ justfile_directory() }}/protos/gamehost.proto

grpc-hello addr="localhost":
  grpcurl -plaintext -proto protos/gamehost.proto -d '{"name": "hyu"}' {{ addr }}:12345 gamehost.Greeter/SayHello

# Redirect Android Emulator port to host
aemu-redir-add console_port="5554" host_port="12345" vm_port="12345":
  #!/bin/sh

  token=$(realpath "$HOME/.emulator_console_auth_token")
  if [ ! -r "$token" ]; then
    echo "[x] emulator auth token not found"
    exit 1
  fi

  (
    echo "auth $(cat "$token")"
    echo "redir add tcp:{{ host_port }}:{{ vm_port }}"
    echo "quit"
  ) | \
  nc localhost "{{ console_port }}"

# Remove Android Emulator redirection
aemu-redir-del console_port="5554" host_port="12345":
  #!/bin/sh

  token=$(realpath "$HOME/.emulator_console_auth_token")
  if [ ! -r "$token" ]; then
    echo "[x] emulator auth token not found"
    exit 1
  fi

  (
    echo "auth $(cat "$token")"
    echo "redir del tcp:{{ host_port }}"
    echo "quit"
  ) | \
  nc localhost "{{ console_port }}"
