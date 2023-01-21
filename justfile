# Use with https://github.com/casey/just

# list commands
default:
  @just --list

# Generate gRPC code
grpc-gen:
  protoc --dart_out=grpc:{{ justfile_directory() }}/lib/src/generated -Iprotos {{ justfile_directory() }}/protos/gamehost.proto
