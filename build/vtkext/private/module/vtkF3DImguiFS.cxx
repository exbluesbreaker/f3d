// SPDX-FileCopyrightText: Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
// SPDX-License-Identifier: BSD-3-Clause
#include "vtkF3DImguiFS.h"

const char *vtkF3DImguiFS =
"//VTK::System::Dec\n"
"\n"
"uniform sampler2D Texture;\n"
"\n"
"in vec2 Frag_UV;\n"
"in vec4 Frag_Color;\n"
"\n"
"out vec4 Out_Color;\n"
"\n"
"void main()\n"
"{\n"
"    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);\n"
"}\n"
"";
