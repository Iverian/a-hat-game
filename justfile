# Use with https://github.com/casey/just

dart_line_length := "100"

# list commands
default:
  @just --list

# Format code
fmt:
  dart format --line-length "{{ dart_line_length }}" --fix "{{ justfile_directory() }}/lib"

# Generate gRPC code
gen-grpc: && fmt
  #!/bin/sh
  set -eu

  base_dir=$(realpath "{{ justfile_directory() }}")
  dart_line_length="{{ dart_line_length }}"
  in_dir="${base_dir}/proto"
  out_dir="${base_dir}/lib/generated"

  mkdir -p "${out_dir}"
  for i in $(find "${in_dir}" -name '*.proto' -type f) ; do
    p=$(realpath "--relative-to=${base_dir}" "${i}")
    (set -x ; protoc "--dart_out=grpc:${out_dir}" "-I${base_dir}" "${p}")
  done

# Generate code
gen-build: && fmt
  #!/bin/sh
  set -eu

  base_dir=$(realpath "{{ justfile_directory() }}")
  ( set -x ; flutter pub run build_runner build )

# Redirect Android Emulator port to host
aemu-redir-add console_port host_port="9010" vm_port="9010":
  #!/bin/sh
  set -eux

  token=$(realpath "$HOME/.emulator_console_auth_token")
  if [ ! -r "$token" ]; then
    echo "[x] emulator auth token not found"
    exit 1
  fi

  {
    echo "auth $(cat "$token")"
    echo "redir add tcp:{{ host_port }}:{{ vm_port }}"
    echo "quit"
  } | \
  nc localhost "{{ console_port }}"

# Remove Android Emulator redirection
aemu-redir-del console_port host_port="9010":
  #!/bin/sh
  set -eu

  token=$(realpath "$HOME/.emulator_console_auth_token")
  if [ ! -r "$token" ]; then
    echo "[x] emulator auth token not found"
    exit 1
  fi

  {
    echo "auth $(cat "$token")"
    echo "redir del tcp:{{ host_port }}"
    echo "quit"
  } | \
  nc localhost "{{ console_port }}"
