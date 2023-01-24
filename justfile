# Use with https://github.com/casey/just

# list commands
default:
  @just --list

# Format code
fmt:
  flutter format --line-length 100 --fix "{{ justfile_directory() }}/lib"

# Generate gRPC code
grpc-gen:
  #!/bin/sh
  set -eu

  in_dir=$(realpath "{{ justfile_directory() }}/proto")
  out_dir=$(realpath "{{ justfile_directory() }}/lib/generated")
  mkdir -p "${out_dir}"

  for i in $(find "${in_dir}" -name '*.proto' -type f) ; do
    p=$(realpath "--relative-to=${in_dir}" "${i}")
    protoc "--dart_out=grpc:${out_dir}" "-I${in_dir}" "${p}"
  done

  flutter format --line-length 100 --fix "{{ justfile_directory() }}/lib/proto"

grpc-hello addr="localhost":
  grpcurl -plaintext -proto protos/gamehost.proto -d '{"name": "hyu"}' {{ addr }}:12345 gamehost.Greeter/SayHello

# Redirect Android Emulator port to host
aemu-redir-add console_port="5554" host_port="12345" vm_port="12345":
  #!/bin/sh
  set -eu

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
  set -eu

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
