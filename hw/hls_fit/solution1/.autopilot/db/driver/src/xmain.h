// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMAIN_H
#define XMAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmain_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XMain_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMain;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMain_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMain_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMain_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMain_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMain_Initialize(XMain *InstancePtr, u16 DeviceId);
XMain_Config* XMain_LookupConfig(u16 DeviceId);
int XMain_CfgInitialize(XMain *InstancePtr, XMain_Config *ConfigPtr);
#else
int XMain_Initialize(XMain *InstancePtr, const char* InstanceName);
int XMain_Release(XMain *InstancePtr);
#endif

void XMain_Start(XMain *InstancePtr);
u32 XMain_IsDone(XMain *InstancePtr);
u32 XMain_IsIdle(XMain *InstancePtr);
u32 XMain_IsReady(XMain *InstancePtr);
void XMain_Continue(XMain *InstancePtr);
void XMain_EnableAutoRestart(XMain *InstancePtr);
void XMain_DisableAutoRestart(XMain *InstancePtr);
u32 XMain_Get_return(XMain *InstancePtr);


void XMain_InterruptGlobalEnable(XMain *InstancePtr);
void XMain_InterruptGlobalDisable(XMain *InstancePtr);
void XMain_InterruptEnable(XMain *InstancePtr, u32 Mask);
void XMain_InterruptDisable(XMain *InstancePtr, u32 Mask);
void XMain_InterruptClear(XMain *InstancePtr, u32 Mask);
u32 XMain_InterruptGetEnabled(XMain *InstancePtr);
u32 XMain_InterruptGetStatus(XMain *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
