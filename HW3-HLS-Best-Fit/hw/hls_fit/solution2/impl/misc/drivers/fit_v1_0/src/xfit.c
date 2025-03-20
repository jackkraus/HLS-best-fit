// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfit.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFit_CfgInitialize(XFit *InstancePtr, XFit_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFit_Start(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFit_IsDone(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFit_IsIdle(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFit_IsReady(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFit_Continue(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XFit_EnableAutoRestart(XFit *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFit_DisableAutoRestart(XFit *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_AP_CTRL, 0);
}

void XFit_Set_arrx(XFit *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRX_DATA, (u32)(Data));
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRX_DATA + 4, (u32)(Data >> 32));
}

u64 XFit_Get_arrx(XFit *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRX_DATA);
    Data += (u64)XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRX_DATA + 4) << 32;
    return Data;
}

void XFit_Set_arry(XFit *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRY_DATA, (u32)(Data));
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRY_DATA + 4, (u32)(Data >> 32));
}

u64 XFit_Get_arry(XFit *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRY_DATA);
    Data += (u64)XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRY_DATA + 4) << 32;
    return Data;
}

void XFit_Set_arrsigs(XFit *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRSIGS_DATA, (u32)(Data));
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRSIGS_DATA + 4, (u32)(Data >> 32));
}

u64 XFit_Get_arrsigs(XFit *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRSIGS_DATA);
    Data += (u64)XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ARRSIGS_DATA + 4) << 32;
    return Data;
}

void XFit_Set_size(XFit *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XFit_Get_size(XFit *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XFit_InterruptGlobalEnable(XFit *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_GIE, 1);
}

void XFit_InterruptGlobalDisable(XFit *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_GIE, 0);
}

void XFit_InterruptEnable(XFit *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_IER);
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_IER, Register | Mask);
}

void XFit_InterruptDisable(XFit *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_IER);
    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFit_InterruptClear(XFit *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFit_WriteReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ISR, Mask);
}

u32 XFit_InterruptGetEnabled(XFit *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_IER);
}

u32 XFit_InterruptGetStatus(XFit *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFit_ReadReg(InstancePtr->Control_BaseAddress, XFIT_CONTROL_ADDR_ISR);
}

