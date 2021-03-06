// RUN: llvm-mc -arch=amdgcn -mcpu=tahiti -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=SI -check-prefix=SICI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=bonaire -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=CI -check-prefix=SICI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=tonga -show-encoding %s | FileCheck -check-prefix=GCN -check-prefix=VI %s

//===----------------------------------------------------------------------===//
// Test for dfmt and nfmt (tbuffer only)
//===----------------------------------------------------------------------===//

tbuffer_load_format_x v1, off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_load_format_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x78,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_load_format_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x78,0xe9,0x00,0x01,0x01,0x01]

tbuffer_load_format_xy v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_load_format_xy v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x79,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_load_format_xy v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x78,0xe9,0x00,0x01,0x01,0x01]

tbuffer_load_format_xyz v[1:4], off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_load_format_xyz v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7a,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_load_format_xyz v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x79,0xe9,0x00,0x01,0x01,0x01]

tbuffer_load_format_xyzw v[1:4], off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_load_format_xyzw v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7b,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_load_format_xyzw v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x79,0xe9,0x00,0x01,0x01,0x01]

tbuffer_store_format_x v1, off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_store_format_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7c,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_store_format_x v1, off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7a,0xe9,0x00,0x01,0x01,0x01]

tbuffer_store_format_xy v[1:2], off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_store_format_xy v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7d,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_store_format_xy v[1:2], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7a,0xe9,0x00,0x01,0x01,0x01]

tbuffer_store_format_xyzw v[1:4], off, s[4:7], dfmt:15, nfmt:2, s1
// SICI: tbuffer_store_format_xyzw v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x00,0x7f,0xe9,0x00,0x01,0x01,0x01]
// VI:   tbuffer_store_format_xyzw v[1:4], off, s[4:7],  dfmt:15,  nfmt:2, s1 ; encoding: [0x00,0x80,0x7b,0xe9,0x00,0x01,0x01,0x01]

tbuffer_store_format_xyzw v[1:4], off, ttmp[4:7], dfmt:15, nfmt:2, ttmp1
// SICI: tbuffer_store_format_xyzw v[1:4], off, ttmp[4:7],  dfmt:15,  nfmt:2, ttmp1 ; encoding: [0x00,0x00,0x7f,0xe9,0x00,0x01,0x1d,0x71]
// VI:   tbuffer_store_format_xyzw v[1:4], off, ttmp[4:7], dfmt:15,  nfmt:2, ttmp1 ; encoding: [0x00,0x80,0x7b,0xe9,0x00,0x01,0x1d,0x71]

