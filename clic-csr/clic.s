foo:
# CLIC registers
       csrr a0, mtvt
       csrr a0, mnxti
       csrr a0, mintstatus
       csrrw sp,mscratchcsw,sp
