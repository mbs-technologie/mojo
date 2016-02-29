// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library ioctl_terminal_mojom;

const int kIoctlTerminalInvalid = 0;
const int kIoctlTerminalGetSettings = 1;
const int kIoctlTerminalSetSettings = 2;
const int kIoctlTerminalGetWindowSize = 3;
const int kIoctlTerminalSetWindowSize = 4;
const int kIoctlTerminalTermiosBaseFieldCount = 6;
const int kIoctlTerminalTermiosIFlagIndex = 0;
const int kIoctlTerminalTermiosOFlagIndex = 1;
const int kIoctlTerminalTermiosCFlagIndex = 2;
const int kIoctlTerminalTermiosLFlagIndex = 3;
const int kIoctlTerminalTermiosISpeedIndex = 4;
const int kIoctlTerminalTermiosOSpeedIndex = 5;
const int kIoctlTerminalTermiosCtrlCharCount = 17;
const int kIoctlTerminalTermiosCtrlCharVintrIndex = 17;
const int kIoctlTerminalTermiosCtrlCharVquitIndex = 18;
const int kIoctlTerminalTermiosCtrlCharVeraseIndex = 19;
const int kIoctlTerminalTermiosCtrlCharVkillIndex = 20;
const int kIoctlTerminalTermiosCtrlCharVeofIndex = 21;
const int kIoctlTerminalTermiosCtrlCharVtimeIndex = 22;
const int kIoctlTerminalTermiosCtrlCharVminIndex = 23;
const int kIoctlTerminalTermiosCtrlCharVswtcIndex = 24;
const int kIoctlTerminalTermiosCtrlCharVstartIndex = 25;
const int kIoctlTerminalTermiosCtrlCharVstopIndex = 26;
const int kIoctlTerminalTermiosCtrlCharVsuspIndex = 27;
const int kIoctlTerminalTermiosCtrlCharVeolIndex = 28;
const int kIoctlTerminalTermiosCtrlCharVreprintIndex = 29;
const int kIoctlTerminalTermiosCtrlCharVdiscardIndex = 30;
const int kIoctlTerminalTermiosCtrlCharVweraseIndex = 31;
const int kIoctlTerminalTermiosCtrlCharVlnextIndex = 32;
const int kIoctlTerminalTermiosCtrlCharVeol2Index = 33;
const int kIoctlTerminalTermiosIFlagIgnbrk = 1;
const int kIoctlTerminalTermiosIFlagBrkint = 2;
const int kIoctlTerminalTermiosIFlagIgnpar = 4;
const int kIoctlTerminalTermiosIFlagParmrk = 8;
const int kIoctlTerminalTermiosIFlagInpck = 16;
const int kIoctlTerminalTermiosIFlagIstrip = 32;
const int kIoctlTerminalTermiosIFlagInlcr = 64;
const int kIoctlTerminalTermiosIFlagIgncr = 128;
const int kIoctlTerminalTermiosIFlagIcrnl = 256;
const int kIoctlTerminalTermiosIFlagIuclc = 512;
const int kIoctlTerminalTermiosIFlagIxon = 1024;
const int kIoctlTerminalTermiosIFlagIxany = 2048;
const int kIoctlTerminalTermiosIFlagIxoff = 4096;
const int kIoctlTerminalTermiosIFlagImaxbel = 8192;
const int kIoctlTerminalTermiosIFlagIutf8 = 16384;
const int kIoctlTerminalTermiosOFlagOpost = 1;
const int kIoctlTerminalTermiosOFlagOlcuc = 2;
const int kIoctlTerminalTermiosOFlagOnlcr = 4;
const int kIoctlTerminalTermiosOFlagOcrnl = 8;
const int kIoctlTerminalTermiosOFlagOnocr = 16;
const int kIoctlTerminalTermiosOFlagOnlret = 32;
const int kIoctlTerminalTermiosOFlagOfill = 64;
const int kIoctlTerminalTermiosOFlagOfdel = 128;
const int kIoctlTerminalTermiosOFlagNldly = 256;
const int kIoctlTerminalTermiosOFlagNL0 = 0;
const int kIoctlTerminalTermiosOFlagNl1 = 256;
const int kIoctlTerminalTermiosOFlagCrdly = 1536;
const int kIoctlTerminalTermiosOFlagCR0 = 0;
const int kIoctlTerminalTermiosOFlagCr1 = 512;
const int kIoctlTerminalTermiosOFlagCr2 = 1024;
const int kIoctlTerminalTermiosOFlagCr3 = 1536;
const int kIoctlTerminalTermiosOFlagTabdly = 6144;
const int kIoctlTerminalTermiosOFlagTaB0 = 0;
const int kIoctlTerminalTermiosOFlagTab1 = 2048;
const int kIoctlTerminalTermiosOFlagTab2 = 4096;
const int kIoctlTerminalTermiosOFlagTab3 = 6144;
const int kIoctlTerminalTermiosOFlagBsdly = 8192;
const int kIoctlTerminalTermiosOFlagBS0 = 0;
const int kIoctlTerminalTermiosOFlagBs1 = 8192;
const int kIoctlTerminalTermiosOFlagVtdly = 16384;
const int kIoctlTerminalTermiosOFlagVT0 = 0;
const int kIoctlTerminalTermiosOFlagVt1 = 16384;
const int kIoctlTerminalTermiosOFlagFfdly = 32768;
const int kIoctlTerminalTermiosOFlagFF0 = 0;
const int kIoctlTerminalTermiosOFlagFf1 = 32768;
const int kIoctlTerminalTermiosCFlagCsize = 3;
const int kIoctlTerminalTermiosCFlagCs5 = 0;
const int kIoctlTerminalTermiosCFlagCs6 = 1;
const int kIoctlTerminalTermiosCFlagCs7 = 2;
const int kIoctlTerminalTermiosCFlagCs8 = 3;
const int kIoctlTerminalTermiosCFlagCstopb = 4;
const int kIoctlTerminalTermiosCFlagCread = 8;
const int kIoctlTerminalTermiosCFlagParenb = 16;
const int kIoctlTerminalTermiosCFlagParodd = 32;
const int kIoctlTerminalTermiosCFlagHupcl = 64;
const int kIoctlTerminalTermiosCFlagClocal = 128;
const int kIoctlTerminalTermiosLFlagIsig = 1;
const int kIoctlTerminalTermiosLFlagIcanon = 2;
const int kIoctlTerminalTermiosLFlagXcase = 4;
const int kIoctlTerminalTermiosLFlagEcho = 8;
const int kIoctlTerminalTermiosLFlagEchoe = 16;
const int kIoctlTerminalTermiosLFlagEchok = 32;
const int kIoctlTerminalTermiosLFlagEchonl = 64;
const int kIoctlTerminalTermiosLFlagNoflsh = 128;
const int kIoctlTerminalTermiosLFlagTostop = 256;





