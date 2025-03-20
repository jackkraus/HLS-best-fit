// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFIT_H
#define XFIT_H

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
#include "xfit_hw.h"

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
} XFit_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFit;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFit_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFit_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFit_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFit_ReadReg(BaseAddress, RegOffset) \
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
int XFit_Initialize(XFit *InstancePtr, u16 DeviceId);
XFit_Config* XFit_LookupConfig(u16 DeviceId);
int XFit_CfgInitialize(XFit *InstancePtr, XFit_Config *ConfigPtr);
#else
int XFit_Initialize(XFit *InstancePtr, const char* InstanceName);
int XFit_Release(XFit *InstancePtr);
#endif

void XFit_Start(XFit *InstancePtr);
u32 XFit_IsDone(XFit *InstancePtr);
u32 XFit_IsIdle(XFit *InstancePtr);
u32 XFit_IsReady(XFit *InstancePtr);
void XFit_Continue(XFit *InstancePtr);
void XFit_EnableAutoRestart(XFit *InstancePtr);
void XFit_DisableAutoRestart(XFit *InstancePtr);

void XFit_Set_arrx(XFit *InstancePtr, u64 Data);
u64 XFit_Get_arrx(XFit *InstancePtr);
void XFit_Set_arry(XFit *InstancePtr, u64 Data);
u64 XFit_Get_arry(XFit *InstancePtr);
void XFit_Set_arrsigs(XFit *InstancePtr, u64 Data);
u64 XFit_Get_arrsigs(XFit *InstancePtr);
void XFit_Set_size(XFit *InstancePtr, u32 Data);
u32 XFit_Get_size(XFit *InstancePtr);

void XFit_InterruptGlobalEnable(XFit *InstancePtr);
void XFit_InterruptGlobalDisable(XFit *InstancePtr);
void XFit_InterruptEnable(XFit *InstancePtr, u32 Mask);
void XFit_InterruptDisable(XFit *InstancePtr, u32 Mask);
void XFit_InterruptClear(XFit *InstancePtr, u32 Mask);
u32 XFit_InterruptGetEnabled(XFit *InstancePtr);
u32 XFit_InterruptGetStatus(XFit *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
