let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class RVInst_rr<string opcodestr, bits<7> funct7>
    : RVInstR<funct7, 0b000, OPC_CUSTOM_0, (outs GPR: $rd), (ins GPR:$rs1, GPR:$rs2),
              opcodestr, "$rs1, $rs2"> {
  let rd = 0;
}

def SFENCE_VMAS : RVInst_rr<"sfence.vmas", 0b0000010>, Sched<[]>;
def : PatGprGpr<int_riscv_sfence_vmas, SFENCE_VMAS>;

def SYNC : RVInst_nr<OPC_CUSTOM_0, "sync", 0b0000000, 0b11000>, Sched<[]>;
def : Pat<(int_riscv_sync), (SYNC)>;