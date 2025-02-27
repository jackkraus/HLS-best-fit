// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfit.h"

extern XFit_Config XFit_ConfigTable[];

XFit_Config *XFit_LookupConfig(u16 DeviceId) {
	XFit_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFIT_NUM_INSTANCES; Index++) {
		if (XFit_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFit_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFit_Initialize(XFit *InstancePtr, u16 DeviceId) {
	XFit_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFit_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFit_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

