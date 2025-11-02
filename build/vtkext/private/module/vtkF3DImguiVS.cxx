// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkF3DImguiVS.h"

const char *vtkF3DImguiVS =
"//VTK::System::Dec\n"
"\n"
"uniform vec2 Scale;\n"
"uniform vec2 Shift;\n"
"\n"
"in vec2 Position;\n"
"in vec2 UV;\n"
"in vec4 Color;\n"
"\n"
"out vec2 Frag_UV;\n"
"out vec4 Frag_Color;\n"
"\n"
"void main()\n"
"{\n"
"    Frag_UV = UV;\n"
"    Frag_Color = Color;\n"
"    gl_Position = vec4(Scale * Position + Shift, 0, 1);\n"
"}\n"
"";
