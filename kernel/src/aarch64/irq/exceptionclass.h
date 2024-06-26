#ifndef KERNEL_EXCEPTIONCLASS_H
#define KERNEL_EXCEPTIONCLASS_H

enum class ExceptionClass
{
    UNKNOWN = 0x00,
    TRAPPED_WF = 0x01,
    TRAPPED_MCR = 0x03,
    TRAPPED_MCRR = 0x04,
    TRAPPED_MCR_2 = 0x05,
    TRAPPED_LDC = 0x06,
    FP_ACCESS = 0x07,
    TRAPPED_LD64B = 0x0A,
    TRAPPED_MRRC = 0x0C,
    BRANCH_TARGET = 0x0D,
    ILLEGAL_EXE_STATE = 0x0E,
    SVC_AARCH32 = 0x11,
    SVC_AARCH64 = 0x15,
    TRAPPED_SYS_INST = 0x18,
    SVE_ACCESS = 0x19,
    POINTER_AUCH = 0x1C,
    INST_ABORT_EL0 = 0x20,
    INST_ABORT_EL1 = 0x21,
    PC_ALIGNMENT = 0x22,
    DATA_ABORT_EL0 = 0x24,
    DATA_ABORT_EL1 = 0x25,
    SP_ALIGNMENT = 0x26,
    MEMORY_OP = 0x27,
    TRAPPED_FP_AARCH32 = 0x28,
    TRAPPED_FP_AARCH64 = 0x2C,
    SERROR = 0x2F,
    BRK_EL0 = 0x30,
    BRK_EL1 = 0x31,
    STEP_EL0 = 0x32,
    STEP_EL1 = 0x33,
    WATCH_EL0 = 0x34,
    WATCH_EL1 = 0x35,
    BKPT_AARCH32 = 0x38,
    BRK_AARCH64 = 0x3C
};

#endif