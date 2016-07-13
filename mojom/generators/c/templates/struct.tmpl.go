// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package templates

const GenerateStructDeclarations = `
{{- /* . (dot) refers to the Go type |cgen.StructTemplate| */ -}}
{{define "GenerateStructDeclarations" -}}
{{- $struct := . -}}

// -- {{$struct.Name}} --
// Enums
{{range $enum := $struct.Enums -}}
{{template "GenerateEnum" $enum}}
{{end -}}

// Constants
{{range $const := $struct.Constants -}}
extern const {{$const.Type}} {{$const.Name}};
{{end -}}

// Struct definition
struct {{$struct.Name}} {
  struct MojomStructHeader header_;
  {{range $field := $struct.Fields -}}
  {{$field.Text}};  // {{$field.Comment}}
  {{end}}
};

struct {{$struct.Name}}* {{$struct.Name}}_New(struct MojomBuffer* in_buffer);

void {{$struct.Name}}_Init(
  struct {{$struct.Name}}* in_data);

void {{$struct.Name}}_CloseAllHandles(
  struct {{$struct.Name}}* in_data);

struct {{$struct.Name}}* {{$struct.Name}}_DeepCopy(
  struct MojomBuffer* in_buffer,
  struct {{$struct.Name}}* in_data);

size_t {{$struct.Name}}_ComputeSerializedSize(
  const struct {{$struct.Name}}* in_data);

void {{$struct.Name}}_EncodePointersAndHandles(
  struct {{$struct.Name}}* inout_buf, uint32_t in_buf_size,
  struct MojomHandleBuffer* inout_handle_buffer);

void {{$struct.Name}}_DecodePointersAndHandles(
  void* inout_buf, uint32_t in_buf_size,
  MojoHandle inout_handles[], uint32_t in_num_handles);

MojomValidationResult {{$struct.Name}}_Validate(
  const void* in_buf, uint32_t in_buf_size,
  const MojoHandle in_handles[], uint32_t in_num_handles);

{{end}}
`

// TODO(vardhan): Move other struct constant definitions in here.
const GenerateStructDefinitions = `
{{- /* . (dot) refers to the Go type |cgen.StructTemplate| */ -}}
{{define "GenerateStructDefinitions" -}}
{{- $struct := . -}}

size_t {{$struct.Name}}_ComputeSerializedSize(
    const struct {{$struct.Name}}* in_data) {
  return MojomStruct_ComputeSerializedSize(
    &{{$struct.Name}}__TypeDesc,
		(const struct MojomStructHeader*)in_data);
}

void {{$struct.Name}}_EncodePointersAndHandles(
  struct {{$struct.Name}}* inout_buf, uint32_t in_buf_size,
  struct MojomHandleBuffer* inout_handle_buffer) {
  MojomStruct_EncodePointersAndHandles(
    &{{$struct.Name}}__TypeDesc,
    (struct MojomStructHeader*)inout_buf, in_buf_size, inout_handle_buffer);
}

{{end}}
`
